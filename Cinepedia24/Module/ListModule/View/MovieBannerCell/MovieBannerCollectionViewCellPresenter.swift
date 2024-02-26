//
//  MovieBannerCollectionViewCellPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 26.02.2024.
//

import Foundation

protocol MovieBannerCollectionViewCellPresenterProtocol: AnyObject {
    func load()
}

final class MovieBannerCollectionViewCellPresenter {
    
    weak var view: MovieBannerCollectionViewCellProtocol?
    private let movie: ListResult
    
    init(view: MovieBannerCollectionViewCellProtocol?, movie: ListResult) {
        self.view = view
        self.movie = movie
    }
}

extension MovieBannerCollectionViewCellPresenter: MovieBannerCollectionViewCellPresenterProtocol {
    
    func load() {
        let baseUrl = "https://image.tmdb.org/t/p/original/"
        if  let image = movie.backdrop_path,
            let url = URL(string: baseUrl + image) {
            view?.setBannerImage(url)
        }
        
        if let title = movie.title,
           let year = movie.release_date?.prefix(4) {
            let yearText = year == "" ? "" : " (" + year + ")"
            view?.setbannerTitle(title + yearText)
        }
        view?.setAccessibilityIdentifiers()
    }
    
}
