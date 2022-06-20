import UIKit

final class IssueCell: UICollectionViewCell {

    static var identifier: String {
        return "\(self)"
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "제목"
        label.font = .SFProDisplay.bold(22)
        label.textColor = .GreyScale.black
        label.sizeToFit()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "이슈에 대한 설명"
        label.font = .SFProDisplay.regular(17)
        label.textColor = .GreyScale.grey1
        label.sizeToFit()
        return label
    }()

    private lazy var mileStoneLabel: UILabel = {
        let label = UILabel()
        label.text = "〒마일스톤 이름"
        label.font = .SFProDisplay.regular(17)
        label.textColor = .GreyScale.grey1
        label.sizeToFit()
        return label
    }()

    private lazy var labelCollectionViewDataSource = LabelCollectionViewDataSource()

    private lazy var labelCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: LayoutFactory.createLabelLayout())
        collectionView.register(LabelCollectionViewCell.self, forCellWithReuseIdentifier: LabelCollectionViewCell.identifier)
        collectionView.dataSource = labelCollectionViewDataSource
        collectionView.isScrollEnabled = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutTitleLabel()
        layoutDescriptionLabel()
        layoutMileStoneLabel()
        layoutCollectionView()
        layoutIfNeeded()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        layoutTitleLabel()
        layoutDescriptionLabel()
        layoutMileStoneLabel()
        layoutCollectionView()
        layoutIfNeeded()
    }
}

private extension IssueCell {

    func layoutTitleLabel() {
        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(titleLabel.intrinsicContentSize.height)
        }
    }

    func layoutDescriptionLabel() {
        addSubview(descriptionLabel)

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(descriptionLabel.intrinsicContentSize.height)
        }
    }

    func layoutMileStoneLabel() {
        addSubview(mileStoneLabel)

        mileStoneLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(mileStoneLabel.intrinsicContentSize.height)
        }
    }

    func layoutCollectionView() {
        addSubview(labelCollectionView)

        labelCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mileStoneLabel.snp.bottom).offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

}

// MARK: - Providing Function

extension IssueCell {

    func resizeHeight() {
        labelCollectionView.snp.makeConstraints { make in
            make.height.equalTo(labelCollectionView.contentSize.height)
        }
    }

}
