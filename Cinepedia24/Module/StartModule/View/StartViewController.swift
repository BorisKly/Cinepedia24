//
//  StartViewController.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import UIKit

protocol StartViewControllerProtocol: AnyObject {
    func noInternetConnection()
}

class StartViewController: UIViewController {
        
    @IBOutlet weak var startImage: UIImageView!
  
    var presenter: StartPresenterProtocol!

    override func viewDidLoad() {
        print(#function)
        super.viewDidLoad()
        view.backgroundColor = .gray
        presenter.viewDidAppear()
        setAccessibilityIdentifiers()
    }

}

extension StartViewController: StartViewControllerProtocol {
    
    func noInternetConnection() {
        print(#function)
//        showAlert(title: "Connection Error", message: "No Internet Connection. Please check your connection and try again later.")
    }
}

extension StartViewController {
    func setAccessibilityIdentifiers() {
        startImage.accessibilityIdentifier = "startImage"
    }
}

