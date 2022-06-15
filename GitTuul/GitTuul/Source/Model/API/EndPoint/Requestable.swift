import Foundation
import Alamofire

protocol Requestable {
    var baseURL: URL? { get }
    var path: String { get }
    var url: URL? { get }
    var headers: HTTPHeaders { get }
    var parameter: [String: Any] { get }
    var method: Alamofire.HTTPMethod { get }
}
