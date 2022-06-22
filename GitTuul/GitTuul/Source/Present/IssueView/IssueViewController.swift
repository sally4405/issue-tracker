import UIKit
import RxSwift

final class IssueViewController: UIViewController {

    var viewModel: IssueViewModel!
    private let disposebag = DisposeBag()
    private lazy var collectionViewDataSource = IssueViewDataSource(viewModel: self.viewModel)
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
        subscribe()
    }

}

// MARK: - View Layout

private extension IssueViewController {

    func layoutCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
    }

}

// MARK: - Subscribe

extension IssueViewController {

    func subscribe() {
        viewModel.didLoadedData.subscribe { [weak self] _ in
            self?.collectionView.reloadData()
        }.disposed(by: disposebag)
    }

}
