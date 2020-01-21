import UIKit

struct SearchUserViewBuilder {
    static func make() -> SearchUserViewController {
        let viewController = SearchUserViewController()
        let interactor = SearchUserInteractor()
        viewController.presenter = .init(view: viewController, interactor: interactor)
        return viewController
    }
}
