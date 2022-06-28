import UIKit

final class LabelCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }

    private lazy var label: PaddingLabel = {
        let label = PaddingLabel(title: "레이블레이블", color: .Colors.primary2)
        return label
    }()

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

// MARK: - Providing Function

extension LabelCollectionViewCell {
    func configure(with model: Label) {
        label.text = model.name
        label.backgroundColor = UIColor(hex: model.color)
    }
}
