//
//  MovieDetailRouter.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//


import Foundation
import UIKit

protocol MovieDetailRouterProtocol: AnyObject {
    func navigate(_ route: MovieDetailRoutes)
}

enum MovieDetailRoutes {
    case detail(movieId: Int?)
    case openURL(imdbId: String)
}

final class MovieDetailRouter {
    
    weak var viewController: MovieDetailViewController?
    
    static func createModule() -> MovieDetailViewController {
        let movieDetailVC = MovieDetailViewController()
        let interactor = MovieDetailInteractor()
        let router = MovieDetailRouter()
        let presenter = MovieDetailPresenter(view: movieDetailVC, router: router, interactor: interactor)
        movieDetailVC.presenter = presenter
        interactor.delegate = presenter  
        router.viewController = movieDetailVC
        return movieDetailVC
    }
    
}

extension MovieDetailRouter: MovieDetailRouterProtocol {
    
    func navigate(_ route: MovieDetailRoutes) {
//        switch route {
//            
//        case .detail(let movieId):
//            let detailVC = MovieDetailRouter.createModule()
//            detailVC.movieId = movieId
//            viewController?.navigationController?.pushViewController(detailVC, animated: true)
//        
//        case .openURL(let imdbId):
//            if let url = URL(string: "https://www.imdb.com/title/" + imdbId) {
//                UIApplication.shared.open(url)
//            }
//        }
    }
}
