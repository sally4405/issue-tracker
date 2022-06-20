import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {

    static var identifier: String {
        return "\(self)"
    }

    private lazy var label: PaddingLabel = {
        let label = PaddingLabel(title: "레이블레이블", color: .Colors.primary2)
        return label
    }()

    func setLabel(_ title: String) {
        label = PaddingLabel(title: title, color: .Colors.primary2)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutLabel()
    }
}

// MARK: - View Layout

private extension LabelCollectionViewCell {

    func layoutLabel() {
        addSubview(label)

        label.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
