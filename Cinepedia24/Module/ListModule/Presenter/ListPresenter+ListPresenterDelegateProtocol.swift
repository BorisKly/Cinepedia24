//
//  ListPresenter+ListPresenterDelegateProtocol.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 25.02.2024.
//

import Foundation

protocol ListPresenterDelegateProtocol: AnyObject {
    func fetchUpComingMovies(result: MovieListResult)
    func fetchNowPlayingMovies(result: MovieListResult)
}

extension ListPresenter: ListPresenterDelegateProtocol {
    
    func fetchUpComingMovies(result: MovieListResult) {
        listVC?.hideLoadingView()
        
        switch result {
        case .success(let bannersResult):
            if let banners = bannersResult.results {
                self.banners = banners
                listVC?.reloadData()
            }
        case .failure(let error):
            print(error)
        }
    }
    
    func fetchNowPlayingMovies(result: MovieListResult) {
        listVC?.hideLoadingView()
        
        switch result {
        case .success(let moviesResult):
            if let movies = moviesResult.results {
                self.movies = movies
                listVC?.reloadData()
            }
        case .failure(let error):
            print(error)
        }
    }
    
}
