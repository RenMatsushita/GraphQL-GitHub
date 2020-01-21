//
//  SearchUserViewBuilder.swift
//  GitHub
//
//  Created by 築山朋紀 on 2020/01/21.
//

import UIKit

struct SearchUserViewBuilder {
    static func make() -> SearchUserViewController {
        let viewController = SearchUserViewController()
        let interactor = SearchUserInteractor()
        viewController.presenter = .init(view: viewController, interactor: interactor)
        return viewController
    }
}
