import Foundation

struct IssueEntityElement: Decodable {
    let id: Int
    let title: String
    let body: String
    let labels: [LabelEntity]
    let mileStone: MilestoneEntity?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case body
        case mileStone = "milestone"
        case labels
    }
}

