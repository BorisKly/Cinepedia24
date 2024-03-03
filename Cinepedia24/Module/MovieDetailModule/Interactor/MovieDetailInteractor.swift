//
//  MovieDetailInteractor.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//


import Foundation

protocol MovieDetailInteractorProtocol: AnyObject {
    func fetchMovieDetail(_ movieId: Int)
    func fetchSimilarMovies(_ movieId: Int)
}

typealias MovieDetailResult = Result<MovieDetailResponse, Error>
typealias SimilarMoviesResult = Result<SimilarMovieResponse, Error>

fileprivate var movieService: MovieServiceProtocol = MovieService()

final class MovieDetailInteractor {
    var delegate: MovieDetailPresenterDelegateProtocol?
}

extension MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    func fetchMovieDetail(_ movieId: Int) {
        movieService.fetchMovieDetail(movieID: movieId) { [weak self] result in
            guard let self = self else { return }
            self.delegate?.fetchMovieDetail(result: result)
        }
    }
    
    func fetchSimilarMovies(_ movieId: Int) {
        movieService.fetchSimilarMovies(movieID: movieId) { [weak self] result in
            guard let self = self else { return }
            self.delegate?.fetchSimilarMovies(result: result)
        }
    }
    
}
