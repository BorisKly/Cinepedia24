//
//  StartRouter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 23.02.2024.
//

import UIKit

protocol StartRouterProtocol: AnyObject {
    func navigate(_ route: StartRoutes)
}

enum StartRoutes {
    case listScreen
}

final class StartRouter {

    weak var viewController: StartViewController?
    
    static func createModule() -> StartViewController {
        let vс = StartViewController()
        let router = StartRouter()
        let interactor = StartInteractor()
        let presenter = StartPresenter(view: vс, router: router, interactor: interactor)
        vс.presenter = presenter
        interactor.delegate = presenter
        router.viewController = vс
        return vс
    }
}

extension StartRouter: StartRouterProtocol {
    
    func navigate(_ route: StartRoutes) {
        switch route {
        case .listScreen:
            guard let window = viewController?.view.window else { return }
            let listVC = ListRouter.createModule()
            let navigationController = UINavigationController(rootViewController: listVC)
            window.rootViewController = navigationController
        }
    }
}
