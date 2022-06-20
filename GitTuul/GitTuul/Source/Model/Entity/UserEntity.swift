import Foundation

struct UserEntity: Decodable {

    let login: String
    let id: Int
    let node_id: String
    let avatar_url: String
    let gravatar_id: String
    let url: String
    let html_url: String
    let followers_url: String
    let following_url: String
    let gists_url: String
    let starred_url: String
    let subscriptions_url: String
    let organizations_url: String
    let repos_url: String
    let events_url: String
    let received_events_url: String
    let type: String
    let site_admin: Bool
    let name: String
    let company: String
    let blog: String
    let location: String
    let email: String
    let hireable: Bool
    let bio: String
    let twitter_username: String
    let public_repos: String
    let public_gists: String
    let followers: Int
    let following: Int
    let created_at: String
    let updated_at: String
    let private_gists: Int
    let total_private_repos: Int
    let owned_private_repos: Int
    let disk_usage: Int
    let collaborators: Int
    let two_factor_authentication: Bool
    let plan: Plan

}

struct Plan: Decodable {
    let name: String
    let space, private_repos, collaborators: Int
}


//import Foundation
//
//// MARK: - User
//struct UserEntity: Codable {
//    let login: String
//    let id: Int
//    let nodeID: String
//    let avatarURL: String
//    let gravatarID: String
//    let url, htmlURL, followersURL: String
//    let followingURL, gistsURL, starredURL: String
//    let subscriptionsURL, organizationsURL, reposURL: String
//    let eventsURL: String
//    let receivedEventsURL: String
//    let type: String
//    let siteAdmin: Bool
//    let name, company: String
//    let blog: String
//    let location, email: String
//    let hireable: Bool
//    let bio, twitterUsername: String
//    let publicRepos, publicGists, followers, following: Int
//    let createdAt, updatedAt: Date
//    let privateGists, totalPrivateRepos, ownedPrivateRepos, diskUsage: Int
//    let collaborators: Int
//    let twoFactorAuthentication: Bool
//    let plan: Plan
//
//    enum CodingKeys: String, CodingKey {
//        case login, id
//        case nodeID
//        case avatarURL
//        case gravatarID
//        case url
//        case htmlURL
//        case followersURL
//        case followingURL
//        case gistsURL
//        case starredURL
//        case subscriptionsURL
//        case organizationsURL
//        case reposURL
//        case eventsURL
//        case receivedEventsURL
//        case type
//        case siteAdmin
//        case name, company, blog, location, email, hireable, bio
//        case twitterUsername
//        case publicRepos
//        case publicGists
//        case followers, following
//        case createdAt
//        case updatedAt
//        case privateGists
//        case totalPrivateRepos
//        case ownedPrivateRepos
//        case diskUsage
//        case collaborators
//        case twoFactorAuthentication
//        case plan
//    }
//}
//
//// MARK: - Plan
//struct Plan: Codable {
//    let name: String
//    let space, privateRepos, collaborators: Int
//
//    enum CodingKeys: String, CodingKey {
//        case name, space
//        case privateRepos
//        case collaborators
//    }
//}
