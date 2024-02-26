//
//  ListInteractor.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import Foundation


protocol ListInteractorProtocol: AnyObject {
    func fetchUpComingMovies()
    func fetchNowPlayingMovies()
}

typealias MovieListResult = Result<ListResponse, Error>
fileprivate var movieService: MovieServiceProtocol = MovieService()

final class ListInteractor {
    
    weak public var delegate: ListPresenterDelegateProtocol?
    
}

extension ListInteractor: ListInteractorProtocol {
    
    func fetchUpComingMovies() {
        movieService.fetchListUpComing { [weak self] result in
            guard let self = self else { return }
            self.delegate?.fetchUpComingMovies(result: result)
        }
    }
    
    func fetchNowPlayingMovies() {
        movieService.fetchListNowPlaying { [weak self] result in
            guard let self = self else { return }
            self.delegate?.fetchNowPlayingMovies(result: result)
        }
    }
    
}
