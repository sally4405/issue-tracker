import UIKit

final class IssueViewController: UIViewController {

    var viewModel: IssueViewModel!

    private lazy var collectionViewDataSource = IssueViewDataSource()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: LayoutFactory.createIssueLayout())
        collectionView.register(IssueCell.self, forCellWithReuseIdentifier: IssueCell.identifier)
        collectionView.register(IssueHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: IssueHeader.identifier)
        collectionView.dataSource = collectionViewDataSource
        collectionView.autoresizesSubviews = true
        collectionView.automaticallyAdjustsScrollIndicatorInsets = true
        return collectionView
    }()

    convenience init(viewModel: IssueViewModel) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutCollectionView()
    }

}

// MARK: - View Layout

private extension IssueViewController {

    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
