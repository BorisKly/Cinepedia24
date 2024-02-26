//
//  ДшіеМшуцСщтекщддук+AccessibilityIdentifiers.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 26.02.2024.
//

extension ListViewController {
    
    func setAccessibilityIdentifiers() {
          searchBar.accessibilityIdentifier = "listSearchBar"
          collectionView.accessibilityIdentifier = "listCollectionView"
          pageController.accessibilityIdentifier = "listPageController"
          tableView.accessibilityIdentifier = "listTableView"
    }
    
}
