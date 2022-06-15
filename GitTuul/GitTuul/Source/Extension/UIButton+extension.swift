import UIKit.UIButton
import UIKit.UIColor

extension UIButton {

    static let plainAttributedButton: (String) -> UIButton = { title in
        var attribute = AttributedString.init(title)
        attribute.font = .SFProDisplay.semiBold(16)

        var plain = UIButton.Configuration.plain()
        plain.attributedTitle = attribute
        plain.baseForegroundColor = .Colors.primary1

        let button = UIButton(configuration: plain)

        return button
    }

    static let filledAttributedButton: (String, UIImage?) -> UIButton = { title, image in
        var attribute = AttributedString.init(title)
        attribute.font = .SFProDisplay.semiBold(17)

        var filled = UIButton.Configuration.filled()
        filled.attributedTitle = attribute
        filled.image = image
        filled.imagePadding = 8
        filled.contentInsets = NSDirectionalEdgeInsets(top: 17, leading: 0, bottom: 17, trailing: 0)
        filled.baseBackgroundColor = .GreyScale.black

        let button = UIButton(configuration: filled)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true

        return button
    }

}
