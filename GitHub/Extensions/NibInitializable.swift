import UIKit

protocol NibInitializable {}

extension NibInitializable where Self: UIView {
    static func loadFromNib(index: Int = 0) -> Self {
        guard let view = UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: self, options: nil)[index] as? Self else {
            fatalError("Invalid Nib name")
        }
        return view
    }
}

extension UIView: NibInitializable {}
