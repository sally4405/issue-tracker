import Foundation

enum GitHubScope: String {
    case repo, user, gist
    case deleteRepo = "delete_repo"
}
