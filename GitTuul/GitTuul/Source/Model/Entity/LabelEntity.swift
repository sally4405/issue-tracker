import Foundation

struct LabelEntity: Decodable {
    let id: Int
    let name, color: String
}

// MARK: - Providing Function

extension LabelEntity {

    func toDomain() -> Label {
        return Label(id: id, name: name, color: color)
    }

}
