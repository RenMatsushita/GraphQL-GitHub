import UIKit

final class CollectionViewCell<Maker: BackingViewMaker>: UICollectionViewCell {
    let backed: Maker.View
    override init(frame: CGRect) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(frame: frame)
        backingView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(backingView)
        NSLayoutConstraint.activate([
            backingView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backingView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backingView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backingView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        backed.prepareForReuse()
    }
    
    func update(_ closure: ((Maker.View) -> Void)?) {
        if let closure = closure {
            closure(backed)
        }
    }
}

extension CollectionViewCell {
    static func register(to collectionView: UICollectionView) {
        collectionView.register(self, forCellWithReuseIdentifier: Maker.View.reuseIdentifier)
    }
    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, closure: ((Maker.View) -> Void)? = nil) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.update(closure)
        return cell
    }
}
