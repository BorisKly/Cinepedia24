//
//  MovieListTableViewCellPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//

import Foundation

protocol MovieListTableViewCellPresenterProtocol: AnyObject {
    func load()
}

final class MovieListTableViewCellPresenter {
    
    weak var view: MovieListTableViewCellProtocol?
    private let movie: ListResult
    
    init(view: MovieListTableViewCellProtocol?, movie: ListResult) {
        self.view = view
        self.movie = movie
    }
}

extension MovieListTableViewCellPresenter: MovieListTableViewCellPresenterProtocol {
    
    func load() {
        print(#function)
        let baseUrl = "https://image.tmdb.org/t/p/w500/"
        if  let image = movie.backdrop_path,
            let url = URL(string: baseUrl + image) {
            view?.setMovieImage(url)
        }
        
        if let title = movie.title,
           let year = movie.release_date?.prefix(4) {
            let yearText = year == "" ? "" : " (" + year + ")"
            view?.setTitleYearLabel(title + yearText)
        }
        
        if let date = movie.release_date  {
            let formatedDate = date.convertDateFormat(inputDate: date)
            view?.setDateLabel(formatedDate)
        }
        
        if let overview = movie.overview {
            view?.setMovieDescriptionLabel(overview)
        }
        
        view?.setAccessibilityIdentifiers()
    }
    
}

