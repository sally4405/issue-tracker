import Foundation

struct Issue {
    let id: Int
    let title: String
    let body: String?
    let labels: [Label]?
    let milestone: Milestone?
    private var selected: Bool = false

    init(id: Int, title: String, body: String?, labels: [Label]?, milestone: Milestone?) {
        self.id = id
        self.title = title
        self.body = body
        self.labels = labels
        self.milestone = milestone
    }
}

// MARK: - Providing Function

extension Issue {
    var isSelected: Bool {
        return selected
    }

    mutating func toggleSelected() {
        self.selected.toggle()
    }
}
