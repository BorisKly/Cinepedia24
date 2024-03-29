//
//  MovieDetailPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func similarMovie(_ index: Int) -> SimilarMovieOutput?
    func didSelectItemAt(index: Int)
    func loadInputViews()
    func addFavoritesButtonTapped(movieID: Int)
    func goToImdbPage()
}

extension MovieDetailPresenter {
    fileprivate enum Constans {
        static let addFavorites: String = "Add Favorites"
        static let removeFavorites: String = "Unfollow"
    }
}

final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    
    weak var view: MovieDetailViewControllerProtocol?
    let router: MovieDetailRouterProtocol!
    let interactor: MovieDetailInteractorProtocol!
    
    var movieDetail: MovieDetailResponse?
    var similarMovie: [SimilarMovieOutput] = []
    
    init(
        view: MovieDetailViewControllerProtocol,
        router: MovieDetailRouterProtocol,
        interactor: MovieDetailInteractorProtocol
    ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        if let movieId = view?.getMovieId() {
            fetchMovieDetail(with: movieId)
            fetchSimilarMovies(with: movieId)
        }
    }
    
    private func fetchMovieDetail(with movieId: Int) {
        view?.showLoadingView()
        interactor.fetchMovieDetail(movieId)
    }
    
    private func fetchSimilarMovies(with movieId: Int) {
        view?.showLoadingView()
        interactor.fetchSimilarMovies(movieId)
    }
    
    func numberOfItemsInSection() -> Int {
        return similarMovie.count
    }
    
    func similarMovie(_ index: Int) -> SimilarMovieOutput? {
        return similarMovie[index]
    }
    
    func didSelectItemAt(index: Int) {
        guard let movie = similarMovie(index) else { return }
        router.navigate(.detail(movieId: movie.id))
    }
    
    func loadInputViews() {
        
        let baseUrl = "https://image.tmdb.org/t/p/original/"
        if  let image = movieDetail?.backdrop_path,
            let url = URL(string: baseUrl + image) {
            view?.setMoviePoster(url)
        }
        
        if let title = movieDetail?.title {
            view?.setMovieTitle(title)
        }
        
        if let date = movieDetail?.release_date  {
            let formatedDate = date.convertDateFormat(inputDate: date)
            view?.setReleaseDate(formatedDate)
        }
        
        if let voteAverage = movieDetail?.vote_average {
            view?.setVoteScore("\(voteAverage)")
        }
        
        if let overview = movieDetail?.overview {
            view?.setMovieDescription(overview)
        }
        
        if let isFavorite = movieDetail?.favoriteStatus {
            let buttonText = isFavorite ? Constans.removeFavorites : Constans.addFavorites
            view?.setFavoritesButton(buttonText, isAdded: isFavorite)
        }
        
//        if let _ = movieDetail?.imdb_id {
//            view?.setImdbAvaibleView()
//        }
    
    }
    
    func addFavoritesButtonTapped(movieID: Int) {
        if let isFavorite = movieDetail?.favoriteStatus {
            if !isFavorite {
                UserDefaults.standard.set(movieID, forKey: "\(movieID)")
            } else {
                UserDefaults.standard.removeObject(forKey: "\(movieID)")
            }
        }
        
        movieDetail?.favoriteStatus.toggle()
        
        if let isFavorite = movieDetail?.favoriteStatus {
            let buttonText = isFavorite ? Constans.removeFavorites : Constans.addFavorites
            view?.setFavoritesButton(buttonText, isAdded: isFavorite)
        }
    }
    
    func goToImdbPage() {
        if let imdbId = movieDetail?.imdb_id {
            router.navigate(.openURL(imdbId: imdbId))
        }
    }
}

