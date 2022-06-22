import Foundation
import RxSwift

final class IssueCellViewModel {

    private let domain: Issue

    var title: String {
        return self.domain.title
    }
    var body: String {
        return self.domain.body
    }
    var labels: [Label] {
        return  self.domain.labels
    }
    var milestone: String {
        return  self.domain.milestone?.title ?? ""
    }

    init(domain: Issue) {
        self.domain = domain
    }
}
