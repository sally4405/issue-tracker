import UIKit

final class PaddingLabel: UILabel {
    private var padding = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)

    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right

        return contentSize
    }

    convenience init(title: String, color: UIColor) {
        self.init()
        configure(title: title, color: color)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
}

// MARK: - Configure

private extension PaddingLabel {
    func configure(title: String, color: UIColor) {
        translatesAutoresizingMaskIntoConstraints = false
        text = title
        font = .SFProDisplay.regular(17)
        backgroundColor = color
        textAlignment = .center
        textColor = .white
        clipsToBounds = true
        layer.cornerRadius = 10
    }
}
