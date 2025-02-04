import UIKit

final class IssueHeader: UICollectionReusableView {
    static var identifier: String {
        return "\(self)"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
}

// MARK: - Configure

private extension IssueHeader {
    func configure() {
        backgroundColor = .GreyScale.grey5
    }
}
