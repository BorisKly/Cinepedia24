//
//  MovieService.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//

import Foundation

protocol MovieServiceProtocol {
   
    func fetchListUpComing(completionHandler: @escaping (MovieListResult) -> ())
    func fetchListNowPlaying(completionHandler: @escaping (MovieListResult) -> ())
    func fetchSearch(query: String, completionHandler: @escaping (SearchedMovieResult) -> ())
    func fetchMovieDetail(movieID: Int, completionHandler: @escaping (MovieDetailResult) -> ())
    func fetchSimilarMovies(movieID: Int, completionHandler: @escaping (SimilarMoviesResult) -> ())
}

struct MovieService: MovieServiceProtocol {
    
  
    func fetchListUpComing(completionHandler: @escaping (MovieListResult) -> ()) {
        NetworkService.shared.request(NetworkApiMethods.listUpcoming, decodeToType: ListResponse.self, completionHandler: completionHandler)
    }

    func fetchListNowPlaying(completionHandler: @escaping (MovieListResult) -> ()) {
        NetworkService.shared.request(NetworkApiMethods.listNowPlaying, decodeToType: ListResponse.self, completionHandler: completionHandler)
    }

    func fetchSearch(query: String, completionHandler: @escaping (SearchedMovieResult) -> ()) {
        NetworkService.shared.request(NetworkApiMethods.search(query: query), decodeToType: SearchResponse.self, completionHandler: completionHandler)
    }

    func fetchMovieDetail(movieID: Int, completionHandler: @escaping (MovieDetailResult) -> ()) {
        NetworkService.shared.request(NetworkApiMethods.movieDetail(movieID: movieID), decodeToType: MovieDetailResponse.self, completionHandler: completionHandler)
    }

    func fetchSimilarMovies(movieID: Int, completionHandler: @escaping (SimilarMoviesResult) -> ()) {
        NetworkService.shared.request(NetworkApiMethods.similarMovies(movieID: movieID), decodeToType: SimilarMovieResponse.self, completionHandler: completionHandler)
    }
}
