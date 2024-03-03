//
//  ListRouter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import Foundation
import UIKit

protocol ListRouterProtocol: AnyObject {
    func navigate(_ route: ListRoutes)
}

enum ListRoutes {
    case detail(movieId: Int?)
    case search(text: String?)
}

final class ListRouter {
    
    weak var viewController: ListViewController? //  поки не зрозуміло чи це треба
    
    static func createModule() -> ListViewController {
        let listVC = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(listVC: listVC, router: router, interactor: interactor)
        listVC.presenter = presenter
        interactor.delegate = presenter  // той самий делегат
        router.viewController = listVC  // щоб витягти navigationController
        return listVC
    }
    
}

extension ListRouter: ListRouterProtocol {
    
    func navigate(_ route: ListRoutes) {
        switch route {
            
        case .detail(let movieId):
            let detailVC = MovieDetailRouter.createModule()
            detailVC.movieId = movieId
            viewController?.navigationController?.pushViewController(detailVC, animated: true)
            
        case .search(let text):
            return
            guard let text = text,
                  text.count > 2 else { return }
            let searchVC = SearchRouter.createModule()
            searchVC.searchText = text
            
            if let topVC = viewController?.navigationController?.topViewController {
                searchVC.view.frame = topVC.view.bounds
                
                if topVC.children.count > 0 {
                    let viewControllers: [UIViewController] = topVC.children
                    viewControllers.last?.removeFromParent()
                    viewControllers.last?.view.removeFromSuperview()
                }
                viewController?.navigationController?.topViewController?.addChild(searchVC)
                viewController?.navigationController?.topViewController?.view.addSubview(searchVC.view)
            }
        }
    }
}
