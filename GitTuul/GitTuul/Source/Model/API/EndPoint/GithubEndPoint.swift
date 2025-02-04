import Foundation
import Alamofire

enum GithubEndPoint: Requestable {
    case oauth(clientID: String, scopes: [GitHubScope])
    case accessToken(clientID: String, clientSecret: String, code: String)
    case issue
}

extension GithubEndPoint {
    var baseURL: URL? {
        switch self {
        case .oauth, .accessToken:
            return URL(string: "https://github.com/login/oauth")
        default:
            return URL(string: "https://api.github.com")
        }
    }

    var path: String {
        switch self {
        case .oauth:
            return "/authorize"
        case .accessToken:
            return "/access_token"
        case .issue:
            return "/issues"
        }
    }

    var headers: HTTPHeaders {
        switch self {
        case .accessToken:
            return [HTTPHeader.accept("application/json")]
        case.issue:
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
        case .oauth(let clientID, let scopes):
            return ["client_id": clientID, "scopes": scopes]
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
        }
    }
}
