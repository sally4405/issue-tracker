import Foundation
import RxSwift

final class IssueViewModel {

    let network = NetworkManager.shared

    private let disposeBag = DisposeBag()

    init() {
        configure()
    }

}

// MARK: - Configure

private extension IssueViewModel {

    func configure() {
        let endPoint = GithubEndPoint.issue
        network.request(endPoint: endPoint).subscribe { (issue: IssueEntity) in
            // MARK: - TODO value 처리
            print(issue)
        } onError: { error in
            // MARK: - TODO error 처리
            print("issue: ", error)
        }.disposed(by: disposeBag)
    }

}
