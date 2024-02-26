//
//  StartPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 23.02.2024.
//

import Foundation

protocol StartPresenterProtocol: AnyObject {
    func viewDidAppear()
    func routeToList()
}

protocol StartPresenterDelegateProtocol: AnyObject {
    func internetConnection(status: Bool)
}

final class StartPresenter: StartPresenterProtocol {
    
    weak var view: StartViewControllerProtocol!
    let router: StartRouterProtocol!
    let interactor: StartInteractorProtocol!
    
    init(view: StartViewControllerProtocol, router: StartRouterProtocol, interactor: StartInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidAppear() {
        interactor.checkInternetConnection()
    }
    
    func routeToList() {
        router.navigate(.listScreen)
    }
    
}


