import UIKit

final class UserContentView: UIView, BackingViewMaker, ReusableViewType {
    
    typealias View = UserContentView
    @IBOutlet private weak var nameLabel: UILabel!
    
    static func makeBackedView() -> UserContentView {
        return UserContentView()
    }
    func update(for name: String) {
        nameLabel.text = name
    }
    func prepareForReuse() {
        nameLabel.text = nil
    }
}
