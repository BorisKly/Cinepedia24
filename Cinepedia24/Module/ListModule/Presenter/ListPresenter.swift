//
//  ListPresenter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import Foundation

protocol ListPresenterProtocol: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func numberOfItemsInSection() -> Int
    func numberOfItems() -> Int
    func banner(_ index: Int) -> ListResult?
    func movie(_ index: Int) -> ListResult?
    func didSelectRowAt(index: Int)
    func didSelectItemAt(index: Int)
    func searchMovie(searchText: String)
}

final class ListPresenter: ListPresenterProtocol {
    
    weak var listVC: ListViewControllerProtocol?
    let router: ListRouterProtocol!
    let interactor: ListInteractorProtocol!
    
    var banners: [ListResult] = []
    var movies: [ListResult] = []
    
    init(
        listVC: ListViewControllerProtocol,
        router: ListRouterProtocol,
        interactor: ListInteractorProtocol
    ) {
        self.listVC = listVC
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        fetchMovies()
        //можуть бути додані інші функції
    }
    
    func viewWillAppear() {
        listVC?.setUpView()
    }
    
    private func fetchMovies() {
        //listVC?.showLoadingView()
        interactor.fetchUpComingMovies()
        interactor.fetchNowPlayingMovies()
    }
    
    func numberOfItemsInSection() -> Int {
        return banners.count
    }
    
    func numberOfItems() -> Int {
        print(#function)
        print(movies.count)
        return movies.count
    }
    
    func banner(_ index: Int) -> ListResult? {
        return banners[index]
    }
    
    func movie(_ index: Int) -> ListResult? {
        return movies[index]
    }
    
    func didSelectItemAt(index: Int) {
        print(#function)
        guard let banner = banner(index) else { return }
        router.navigate(.detail(movieId: banner.id))
    }
    
    func didSelectRowAt(index: Int) {
        print(#function)
        guard let movie = movie(index) else { return }
        router.navigate(.detail(movieId: movie.id))
    }
    
    func searchMovie(searchText: String) {
        router.navigate(.search(text: searchText))
    }
}

