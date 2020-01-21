import UIKit

protocol ReusableViewType where Self: UIView {
    func prepareForReuse()
}
extension ReusableViewType {
    static var reuseIdentifier: String {
        return String(describing: ObjectIdentifier(self).hashValue)
    }
}
protocol BackingViewMaker {
    associatedtype View: ReusableViewType
    static func makeBackedView() -> View
}
