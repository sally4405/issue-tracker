import UIKit
import RxSwift
import RxCocoa

final class GitTuulTabBarController: UITabBarController {

    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    private let userImage = BehaviorSubject<UIImage>(value: UIImage(systemName: "person") ?? UIImage())

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setup()

        networkManager
            .request(endPoint: GithubEndPoint.user)
            .subscribe { (user: UserEntity) in
                print(user)
                self.userImage.onNext(UIImage(data: try! Data(contentsOf: URL(string: user.avatar_url)!)) ?? UIImage())
            } onError: { error in
                print("user: ", error)
            }
            .disposed(by: disposeBag)
    }

}

// MARK: - Configure

private extension GitTuulTabBarController {

    func configure() {
        tabBar.backgroundColor = .GreyScale.white
        tabBar.tintColor = .Colors.primary1
        tabBar.unselectedItemTintColor = .Custom.label2
    }

    func setup() {
        let issueViewController = ViewControllerFactory.issue.make()
        issueViewController.tabBarItem.title = "이슈"
        issueViewController.tabBarItem.image = UIImage(systemName: "exclamationmark.circle")
        issueViewController.tabBarItem.selectedImage = UIImage(systemName: "exclamationmark.circle.fill")

        let labelViewController = UIViewController()
        labelViewController.tabBarItem.title = "레이블"
        labelViewController.tabBarItem.image = UIImage(systemName: "tag")
        labelViewController.tabBarItem.selectedImage = UIImage(systemName: "tag.fill")

        let milestoneViewController = UIViewController()
        milestoneViewController.tabBarItem.title = "마일스톤"
        milestoneViewController.tabBarItem.image = UIImage(systemName: "signpost.right")
        milestoneViewController.tabBarItem.selectedImage = UIImage(systemName: "signpost.right.fill")

        let accountViewController = UIViewController()
        accountViewController.tabBarItem.title = "내 계정"
        userImage
            .bind(to: accountViewController.tabBarItem.rx.image)
            .disposed(by: disposeBag)
        userImage
            .bind(to: accountViewController.tabBarItem.rx.selectedImage)
            .disposed(by: disposeBag)

        viewControllers = [issueViewController, labelViewController, milestoneViewController, accountViewController]
    }

}
