//
//  CollectionReusableView.swift
//  GitHub
//
//  Created by tomoki_sun on 2020/01/06.
//

import UIKit

enum CollectionViewSupplementaryKind {
    case header
    case footer

    var rawValue: String {
        switch self {
        case .header:
            return UICollectionView.elementKindSectionHeader
        case .footer:
            return UICollectionView.elementKindSectionFooter
        }
    }
}

final class CollectionReusableView<Maker: BackingViewMaker>: UICollectionReusableView {
    let backed: Maker.View
    override init(frame: CGRect) {
        let backingView = Maker.makeBackedView()
        self.backed = backingView
        super.init(frame: frame)
        backingView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backingView)
        NSLayoutConstraint.activate([
            backingView.topAnchor.constraint(equalTo: topAnchor),
            backingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backingView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backingView.bottomAnchor.constraint(equalTo: bottomAnchor)
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

extension CollectionReusableView {
    static func register(to collectionView: UICollectionView, for kind: CollectionViewSupplementaryKind) {
        collectionView.register(self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: Maker.View.reuseIdentifier)
    }
    static func dequeue(from collectionView: UICollectionView,
                        for indexPath: IndexPath,
                        ofKind kind: CollectionViewSupplementaryKind,
                        closure: ((Maker.View) -> Void)? = nil) -> CollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: Maker.View.reuseIdentifier, for: indexPath) as! CollectionReusableView
        view.update(closure)
        return view
    }
}
