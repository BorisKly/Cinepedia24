//
//  SimilarMovieCollectionViewCellPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import Foundation

protocol SimilarMovieCollectionViewCellPresenterProtocol: AnyObject {
    func load()
}

final class SimilarMovieCollectionViewCellPresenter {
    
    weak var view: SimilarMovieCollectionViewCellProtocol?
    private let movie: SimilarMovieOutput
    
    init(view: SimilarMovieCollectionViewCellProtocol?, movie: SimilarMovieOutput) {
        self.view = view
        self.movie = movie
    }
}

extension SimilarMovieCollectionViewCellPresenter: SimilarMovieCollectionViewCellPresenterProtocol {
    
    func load() {
        let baseUrl = "https://image.tmdb.org/t/p/w500/"
        if  let image = movie.backdrop_path,
            let url = URL(string: baseUrl + image) {
            view?.setMoviePoster(url)
        }
        
        if let title = movie.title,
           let year = movie.release_date?.prefix(4) {
            let yearText = year == "" ? "" : " (" + year + ")"
            view?.setTitleYearLabel(title + yearText)
        }
        
        view?.setAccessibilityIdentifiers()
    }
    
}
