import Alamofire
import UIKit
import RxSwift

final class NetworkManager {
    static var shared = NetworkManager()
    private init() {}

    private var token: String?

    func requestCode(endPoint: Requestable) {
        guard let url = endPoint.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }

        components.queryItems = endPoint.parameter.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        if let url = components.url, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // MARK: - TODO error처리
        }
    }

    func request<T: Decodable>(endPoint: Requestable) -> Observable<T> {
        return Observable.create { observer in
            guard let url = endPoint.url else {
                observer.onError(NetworkError.invalidUrl)
                return Disposables.create {}
            }

            var headers: HTTPHeaders = endPoint.headers

            if let token = self.token {
                headers.add(HTTPHeader.authorization("token \(token)"))
            }

            let request: DataRequest = AF.request(url,
                                                  method: endPoint.method,
                                                  parameters: endPoint.parameter,
                                                  headers: headers)

            request
                .validate(statusCode: 200..<300)
                .response { response in
                    if let data = response.data {
                        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                            observer.onError(NetworkError.failToDecode)
                            return
                        }
                        observer.onNext(decodedData)
                        observer.onCompleted()
                    } else {
                        observer.onError(NetworkError.emptyData)
                    }
                }

            return Disposables.create {}
        }
    }

    func setToken(_ token: String) {
        self.token = token
    }
}
