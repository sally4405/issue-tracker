import UIKit

final class IssueViewDataSource: NSObject, UICollectionViewDataSource {
    var viewModel: IssueViewModel?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IssueCell.identifier, for: indexPath) as? IssueCell else { return UICollectionViewCell() }
        if let cellViewModel = viewModel?.cellViewModel(at: indexPath) {
            cell.configure(with: cellViewModel)
        }
        cell.sizeToFit()
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: IssueHeader.identifier,
                for: indexPath
              ) as? IssueHeader else { return UICollectionReusableView() }

        return headerView
    }

    convenience init(viewModel: IssueViewModel) {
        self.init()
        self.viewModel = viewModel
    }
}
