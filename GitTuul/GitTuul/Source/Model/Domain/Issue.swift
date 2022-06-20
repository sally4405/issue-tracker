import Foundation
import Differentiator

struct Issue {
    var title: String
    var description: String
    var mileStone: MileStone
    var labels: [Label]
}

struct Label {
    let name, labelDescription, color: String
}

struct MileStone {
    let title, milestoneDescription: String

}

struct SectionOfIssue {
    var header: IssueHeader
    var items: [Item]
}

extension SectionOfIssue: SectionModelType {
    typealias Item = Issue

    init(original: SectionOfIssue, items: [Item]) {
        self = original
        self.items = items
    }
}
