//
//  SearchInteractor.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 28.02.2024.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
    func fetchSearchedMovies(searchText query: String)
}

protocol SearchInteractorOutputProtocol: AnyObject {
    func fetchSearchedMovies(result: SearchedMovieResult)
}

typealias SearchedMovieResult = Result<SearchResponse, Error>
fileprivate var movieService: MovieServiceProtocol = MovieService()

final class SearchInteractor {
    var output: SearchInteractorOutputProtocol?
}

extension SearchInteractor: SearchInteractorProtocol {
    
    func fetchSearchedMovies(searchText query: String) {
        movieService.fetchSearch(query: query) { [weak self] result in
            guard let self = self else { return }
            self.output?.fetchSearchedMovies(result: result)
        }
    }

}
