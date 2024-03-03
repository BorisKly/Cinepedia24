//
//  SearchTableViewCellPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 28.02.2024.
//

import Foundation

protocol SearchTableViewCellPresenterProtocol: AnyObject {
    func load()
}

final class SearchTableViewCellPresenter {
    
    weak var view: SearchTableViewCellProtocol?
    private let movie: SearchOutput
    
    init(view: SearchTableViewCellProtocol?, movie: SearchOutput) {
        self.view = view
        self.movie = movie
    }
}

extension SearchTableViewCellPresenter: SearchTableViewCellPresenterProtocol {
    
    func load() {
        if let title = movie.title,
           let year = movie.release_date?.prefix(4) {
            let yearText = year == "" ? "" : " (" + year + ")"
            view?.setTitleLabel(title + yearText)
        }
        view?.setAccessibilityIdentifiers()
    }
    
}
