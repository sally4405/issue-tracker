import Foundation

struct MilestoneEntity: Decodable {
    let id: Int
    let title: String
}

// MARK: - Providing Function

extension MilestoneEntity {
    func toDomain() -> Milestone {
        return Milestone(id: id, title: title)
    }
}
