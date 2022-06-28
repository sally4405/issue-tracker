import UIKit

final class LabelCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    private var labels: [Label]?

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LabelCollectionViewCell.identifier, for: indexPath) as? LabelCollectionViewCell else { return UICollectionViewCell() }
        guard let label = labels?[indexPath.item] else { return UICollectionViewCell() }
        cell.configure(with: label)
        return cell
    }

    convenience init(labels: [Label]) {
        self.init()
        self.labels = labels
    }
}

// MARK: - Providing Function

extension LabelCollectionViewDataSource {
    func setLabels(to labels: [Label]) {
        self.labels = labels
    }
}
