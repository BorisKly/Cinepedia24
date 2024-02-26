//
//  StartInteractor.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 23.02.2024.
//


import Foundation

protocol StartInteractorProtocol: AnyObject {
    func checkInternetConnection()
}

final class StartInteractor {
    weak public var delegate: StartPresenterDelegateProtocol?
}

extension StartInteractor: StartInteractorProtocol {
    
    func checkInternetConnection() {
        let internetStatus = NetworkService.shared.isConnectedToInternet()
        self.delegate?.internetConnection(status: internetStatus)
    }

}
