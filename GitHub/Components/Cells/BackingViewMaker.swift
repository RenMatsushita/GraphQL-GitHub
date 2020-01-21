//
//  BackingViewMaker.swift
//  GitHub
//
//  Created by tomoki_sun on 2020/01/06.
//

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
