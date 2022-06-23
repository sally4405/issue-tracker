import Foundation
import RxSwift

final class LoginViewModel {
    let networkManager = NetworkManager.shared
    let endPoint = PublishSubject<GithubEndPoint>()
    private let disposeBag = DisposeBag()

    init() {
        addObserver()
    }
}

private extension LoginViewModel {
    func addObserver() {
        NotificationCenter.default.addObserver(forName: .didGetURLContexts,
                                               object: nil,
                                               queue: .main) { notification in
            guard let code = notification.userInfo?["code"] as? String else { return }
            let endPoint = GithubEndPoint.accessToken(clientID: ClientInformation.clientID,
                                                      clientSecret: ClientInformation.clientSecret,
                                                      code: code)
            self.endPoint.onNext(endPoint)
        }
    }
}

// MARK: - Providing Function

extension LoginViewModel {
    func subscribeEndpoint(completion: @escaping (GithubEndPoint) -> Void) {
        endPoint.subscribe(onNext: completion).disposed(by: disposeBag)
    }
}
