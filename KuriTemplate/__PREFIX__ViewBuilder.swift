import UIKit

struct __PREFIX__ViewBuilder {
    static func make() -> __PREFIX__ViewController {
        let viewController = __PREFIX__ViewController()
        let interactor = __PREFIX__Interactor()
        let presenter = __PREFIX__Presenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return viewController
    }
}
