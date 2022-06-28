import UIKit
import RxCocoa
import RxSwift

final class IssueCell: UICollectionViewCell {
    static var identifier: String {
        return "\(self)"
    }

    private let disposebag = DisposeBag()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplay.bold(22)
        label.textColor = .GreyScale.black
        label.sizeToFit()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .SFProDisplay.regular(17)
        label.textColor = .GreyScale.grey1
        label.sizeToFit()
        label.numberOfLines = 2
        return label
    }()

    private lazy var mileStoneLabel: UILabel = {
        let label = UILabel()
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
        }
    }

    func layoutDescriptionLabel() {
        addSubview(descriptionLabel)

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }
    }

    func layoutMileStoneLabel() {
        addSubview(mileStoneLabel)

        mileStoneLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
        }
    }

    func layoutCollectionView() {
        addSubview(labelCollectionView)

        labelCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mileStoneLabel.snp.bottom).offset(16)
            make.height.equalTo(80)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Providing Function

extension IssueCell {
    func resizeHeight() {
    }

    func configure(with viewModel: IssueCellViewModel) {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.body
        mileStoneLabel.text = viewModel.milestone
        labelCollectionViewDataSource.setLabels(to: viewModel.labels)
        labelCollectionView.reloadData()
        resizeHeight()
    }
}
