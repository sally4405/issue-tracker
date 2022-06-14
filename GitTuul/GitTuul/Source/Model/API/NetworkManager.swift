import Alamofire
import UIKit

final class NetworkManager {

    // MARK: - TODO 값 숨기기
    let clientID = "cff2f5d079f7cedff5ca"
    let clientSecret = "e91c11dd4a213c135ea858026fa548d105ed4da9"

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

    func request(endPoint: Requestable, completion: @escaping (Result<Data, NetworkError>) -> Void) {

        guard let url = endPoint.url else {
            completion(.failure(.invalidUrl))
            return
        }

        let request: DataRequest = AF.request(url,
                                              method: endPoint.method,
                                              parameters: endPoint.parameter,
                                              headers: endPoint.headers)
        request
            .validate(statusCode: 200..<300)
            .response { response in
                if let data = response.data {
                    completion(.success(data))
                } else {
                    completion(.failure(.emptyData))
                }

            }

    }

}
