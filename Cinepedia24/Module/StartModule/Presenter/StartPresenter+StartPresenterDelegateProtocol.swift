//
//  StartPresenter+StartPresenterDelegateProtocol.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//

import Foundation

extension StartPresenter: StartPresenterDelegateProtocol {
    
    func internetConnection(status: Bool) {
        if status {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.routeToList()
            }
        } else {
            view.noInternetConnection()
        }
    }
}
