import UIKit

final class GitTuulTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setup()
    }

    convenience init(data: GithubEntity) {
        self.init()
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
        let issueViewController = IssueViewController()
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
        accountViewController.tabBarItem.image = UIImage(systemName: "person")
        accountViewController.tabBarItem.selectedImage = UIImage(systemName: "person.fill")

        viewControllers = [issueViewController, labelViewController, milestoneViewController, accountViewController]
    }

}
