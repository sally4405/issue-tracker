import UIKit
import RxSwift
import Differentiator
import RxCocoa
import RxDataSources

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
//        setCollectionView()
    }

    private func setCollectionView() {
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionOfIssue>(
            configureCell: { dataSource, collection, indexPath, item in
                let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: IssueCell.identifier, for: indexPath)
                guard let cell = cell as? IssueCell else { return cell }
                cell.setIssue(title: item.title, description: item.description, mileStone: item.mileStone.title, labels: item.labels)
                return cell
            }
        )

        let sections = [
            SectionOfIssue(header: IssueHeader(), items: [Issue(title: "제목1", description: "설명1", mileStone: MileStone(title: "마일스톤1", milestoneDescription: "마일스톤설명1"), labels: [Label(name: "라벨1", labelDescription: "라벨설명1", color: "라벨색깔1")])]),
            SectionOfIssue(header: IssueHeader(), items: [Issue(title: "제목2", description: "설명2", mileStone: MileStone(title: "마일스톤2", milestoneDescription: "마일스톤설명2"), labels: [Label(name: "라벨2", labelDescription: "라벨설명2", color: "라벨색깔2")])]),
            SectionOfIssue(header: IssueHeader(), items: [Issue(title: "제목3", description: "설명3", mileStone: MileStone(title: "마일스톤3", milestoneDescription: "마일스톤설명3"), labels: [Label(name: "라벨3", labelDescription: "라벨설명3", color: "라벨색깔3")])]),
        ]
        let disposeBag = DisposeBag()

        Observable.just(sections)
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)

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
