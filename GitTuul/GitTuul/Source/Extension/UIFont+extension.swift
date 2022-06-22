import UIKit.UIFont

extension UIFont {
    enum SFProDisplay {
        static let bold: (CGFloat) -> UIFont? = { (size) in
            return UIFont(name: "SFProDisplay-Bold", size: size)
        }

        static let semiBold: (CGFloat) -> UIFont? = { (size) in
            return UIFont(name: "SFProDisplay-Semibold", size: size)
        }

        static let regular: (CGFloat) -> UIFont? = { (size) in
            return UIFont(name: "SFProDisplay-Regular", size: size)
        }
    }

    enum SFProText {
        static let regular: (CGFloat) -> UIFont? = { (size) in
            return UIFont(name: "SFProText-Regular", size: size)
        }
    }

    enum Baemin {
        static let kirangHaerang: UIFont? = UIFont(name: "BMKIRANGHAERANG-OTF", size: 48)
    }
}
