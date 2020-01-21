import UIKit

struct SearchResultViewBuilder {
    static func make() -> SearchResultViewController {
        let viewController = SearchResultViewController()
        let interactor = SearchResultInteractor()
        let presenter = SearchResultPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
