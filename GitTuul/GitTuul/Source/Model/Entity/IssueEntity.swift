import Foundation

struct IssueEntity: Decodable {
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

// MARK: - Providing Function

extension IssueEntity {

    func toDomain() -> Issue {
        return Issue(id: id,
                     title: title,
                     body: body,
                     labels: labels.map { $0.toDomain() },
                     mileStone: mileStone?.toDomain())
    }

}
