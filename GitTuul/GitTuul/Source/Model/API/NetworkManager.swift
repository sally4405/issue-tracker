import Alamofire
import UIKit
import RxSwift

final class NetworkManager {

    static var shared = NetworkManager()

    private init() {}

    func requestCode(endPoint: Requestable) {
        guard let url = endPoint.url, var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return }

        components.queryItems = endPoint.parameter.map { key, value in
            URLQueryItem(name: key, value: "\(value)")
        }
        if let url = components.url, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        } else {
            // MARK: - TODO error처리
            print(NetworkError.failToOpen)
        }
    }

    func request<T: Decodable>(endPoint: Requestable) -> Observable<T> {
        return Observable.create { observer in
            guard let url = endPoint.url else {
                observer.onError(NetworkError.invalidUrl)
                return Disposables.create {}
            }

            let request: DataRequest = AF.request(url,
                                                  method: endPoint.method,
                                                  parameters: endPoint.parameter,
                                                  headers: endPoint.headers)
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

}
