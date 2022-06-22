import Foundation
import RxSwift
import RxRelay

final class IssueViewModel {
    let network = NetworkManager.shared
    let didLoadedData = PublishRelay<Void>()
    private let disposeBag = DisposeBag()
    private var viewModels: [IssueCellViewModel] = []

    var count: Int {
        return viewModels.count
    }

    init() {
        configure()
    }
}

// MARK: - Configure

private extension IssueViewModel {
    func configure() {
        let endPoint = GithubEndPoint.issue

        network.request(endPoint: endPoint).subscribe { [weak self] (issue: [IssueEntity]) in
            self?.viewModels = issue.map { IssueCellViewModel(domain: $0.toDomain()) }
            self?.didLoadedData.accept(())
        } onError: { error in
            // MARK: - TODO error 처리
        }.disposed(by: disposeBag)
    }
}

// MARK: - Providing Function

extension IssueViewModel {
    func cellViewModel(at indexPath: IndexPath) -> IssueCellViewModel {
        return viewModels[indexPath.section]
    }
}
