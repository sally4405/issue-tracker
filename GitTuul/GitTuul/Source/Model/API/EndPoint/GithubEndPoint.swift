import Foundation
import Alamofire

enum GithubEndPoint: Requestable {
    case oauth(clientID: String, scope: [GitHubScope])
    case accessToken(clientID: String, clientSecret: String, code: String)
    case issue
    case user
}

extension GithubEndPoint {

    var baseURL: URL? {
        switch self {
        case .oauth, .accessToken:
            return URL(string: "https://github.com")
        default:
            return URL(string: "https://api.github.com")
        }
    }

    var path: String {
        switch self {
        case .oauth:
            return "/login/oauth/authorize"
        case .accessToken:
            return "/login/oauth/access_token"
        case .issue:
            return "/issues"
        case .user:
            return "/user"
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .accessToken:
            return [HTTPHeader.accept("application/json")]
        case .issue, .user:
            return [HTTPHeader.accept("application/vnd.github.v3+json")]
        default:
            return [HTTPHeader.accept("")]
        }
    }

    var url: URL? {
        return baseURL?.appendingPathComponent(path)
    }

    var parameter: [String: Any] {
        switch self {
        case .oauth(let clientID, let scope):
            return ["client_id": clientID, "scopes": scope]
        case .accessToken(let clientID, let clientSecret, let code):
            return ["client_id": clientID, "client_secret": clientSecret, "code": code]
        default:
            return [:]
        }
    }

    var method: Alamofire.HTTPMethod {
        switch self {
        case .oauth:
            return .get
        case .accessToken:
            return .post
        case.issue:
            return .get
        case .user:
            return .get
        }
    }

}
