//
//  MovieDetailPresenterDelegateProtocol.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import Foundation

protocol MovieDetailPresenterDelegateProtocol: AnyObject {
    func fetchMovieDetail(result: MovieDetailResult)
    func fetchSimilarMovies(result: SimilarMoviesResult)
}

extension MovieDetailPresenter: MovieDetailPresenterDelegateProtocol {
    
    func fetchMovieDetail(result: MovieDetailResult) {
        view?.hideLoadingView()
        
        switch result {
        case .success(let movieDetail):
            self.movieDetail = movieDetail
            
            if let movieId = movieDetail.id {
                let storedMovieId = UserDefaults.standard.integer(forKey: "\(movieId)")
                if storedMovieId == movieDetail.id {
                    self.movieDetail?.favoriteStatus = true
                }
            }
            
            view?.reloadData()
            
        case .failure(let error):
            print(error)
        }
    }
    
    func fetchSimilarMovies(result: SimilarMoviesResult) {
        view?.hideLoadingView()
        
        switch result {
        case .success(let similarMovieResult):
            if let movies = similarMovieResult.results {
                self.similarMovie.append(contentsOf: movies)
                view?.reloadData()
            }
            
        case .failure(let error):
            print(error)
        }
    }
    
}



