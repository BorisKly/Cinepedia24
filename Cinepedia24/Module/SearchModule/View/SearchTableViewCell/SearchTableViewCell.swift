//
//  SearchTableViewCell.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 28.02.2024.
//

import UIKit

protocol SearchTableViewCellProtocol: AnyObject {
    func setTitleLabel(_ text: String)
    func setAccessibilityIdentifiers()
}

final class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
  
  
    
    
    var cellPresenter: SearchTableViewCellPresenterProtocol! {
        didSet {            cellPresenter.load()
        }
    }
}

extension SearchTableViewCell: SearchTableViewCellProtocol {
    
    func setTitleLabel(_ text: String) {
        movieTitleLabel.text = text
    }

}


