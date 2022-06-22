import Foundation

struct Milestone {
    let id: Int
    let title: String

    init(id: Int, title: String) {
        self.id = id
        self.title = "〒 \(title)"
    }
}
