//
//  StartViewController.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import UIKit

protocol StartViewControllerProtocol: AnyObject {
    func noInternetConnection()
    func showLoadingView()
    func hideLoadingView()
}

class StartViewController: UIViewController {
        
    @IBOutlet weak var startImage: UIImageView!
  
    var presenter: StartPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setAccessibilityIdentifiers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.viewDidAppear()
    }
}

extension StartViewController: StartViewControllerProtocol, ActivityIndicatorLoading {
   
    func showLoadingView() {
        print(#function)
        showLoading()
    }
    func hideLoadingView() {
        print(#function)
        hideLoading()
    }
    func noInternetConnection() {
        print(#function)
//        showAlert(title: "Connection Error", message: "No Internet Connection. Please check your connection and try again later.")
    }
}



