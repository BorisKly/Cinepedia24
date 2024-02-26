//
//  ListViewController+SearchBar.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import UIKit

extension ListViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if let topVC = self.navigationController?.topViewController {
            
            if topVC.children.count > 0 {
                let viewControllers: [UIViewController] = topVC.children
                viewControllers.last?.removeFromParent()
                viewControllers.last?.view.removeFromSuperview()
            }
        }
        searchBar.text = ""
        searchBar.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ){
            self.presenter.searchMovie(searchText: searchText)
        }
    }
}
