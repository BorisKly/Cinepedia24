//
//  MovieDetailViewController.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import UIKit
import SDWebImage

protocol MovieDetailViewControllerProtocol: AnyObject {
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
    func setUpView()
    func setupCollectionView()
    func setMoviePoster(_ imageUrl: URL)
    func setMovieTitle(_ text: String)
    func setMovieDescription(_ text: String)
    func setVoteScore(_ text: String)
    func setReleaseDate(_ text: String)
    func setFavoritesButton(_ text: String, isAdded: Bool)
   // func setImdbAvaibleView()
    func getMovieId() -> Int?
}

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDescriptionTextView: UITextView!
    @IBOutlet weak var voteScoreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
//    @IBOutlet  weak var imdbAvaibleView: UIView! {
//        didSet {
//            imdbAvaibleView.isHidden = true
//        }
//    }
    @IBOutlet weak var addFavoritesButton: UIButton!{
        didSet {
            addFavoritesButton.layer.cornerRadius = 8
            addFavoritesButton.layer.borderWidth = 1
            addFavoritesButton.layer.borderColor = UIColor.lightGray.cgColor
            addFavoritesButton.backgroundColor = .systemYellow
            addFavoritesButton.tintColor = .black
        }
    }
    var movieId: Int?
    var presenter: MovieDetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setUpView()
        presenter.viewDidLoad()
    }
    
//    @IBAction func didTapImdb(_ sender: Any) {
//        presenter.goToImdbPage()
//    }
    
//    @IBAction func didTapAddFavorites(_ sender: Any) {
//        presenter.addFavoritesButtonTapped(movieID: self.movieId ?? 0)
//    }
    
}

extension MovieDetailViewController: MovieDetailViewControllerProtocol, LoadingShowable {
  
    func setMoviePoster(_ imageUrl: URL) {
        moviePosterImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder_movie_poster"))
    }
    
    func setMovieTitle(_ text: String) {
        movieTitleLabel.text = text
    }
    
    func setMovieDescription(_ text: String) {
        movieDescriptionTextView.text = text
    }
    
    func setVoteScore(_ text: String) {
        voteScoreLabel.text = text
    }
    
    func setReleaseDate(_ text: String) {
        releaseDateLabel.text = text
    }
    
    func setFavoritesButton(_ text: String, isAdded: Bool) {
        addFavoritesButton.setTitle(text, for: .normal)
        addFavoritesButton.backgroundColor = isAdded ? .lightGray : .systemYellow
        addFavoritesButton.tintColor = isAdded ? .white : .black
    }
    
//    func setImdbAvaibleView() {
//        imdbAvaibleView.isHidden = false
//    }
    
    func reloadData() {
        self.presenter.loadInputViews()
        collectionView.reloadData()
    }
    
    func showLoadingView() {
        showLoading()
    }
    
    func hideLoadingView() {
        hideLoading()
    }
    
    func getMovieId() -> Int? {
        return movieId
    }
   
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: SimilarMovieCollectionViewCell.self)
        
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
    }
    
    func setUpView() {
        setAccessibilityIdentifiers()
        self.navigationController?.navigationBar.tintColor = .white
    }
}



