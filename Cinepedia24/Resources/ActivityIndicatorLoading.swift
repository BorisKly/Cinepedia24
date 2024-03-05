//
//  ActivityIndicatorLoading.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 05.03.2024.
//

import UIKit

protocol ActivityIndicatorLoading where Self: UIViewController {
    func showLoading()
    func hideLoading()
}

extension ActivityIndicatorLoading {
    func showLoading() {
        LoadingView.shared.startLoading()
    }

    func hideLoading() {
        LoadingView.shared.hideLoading()
    }
}
