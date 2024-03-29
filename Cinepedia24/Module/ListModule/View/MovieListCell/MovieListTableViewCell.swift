//
//  MovieListTableViewCell.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 26.02.2024.
//

import UIKit
import SDWebImage

protocol MovieListTableViewCellProtocol: AnyObject {
    func setMovieImage(_ imageUrl: URL)
    func setTitleYearLabel(_ text: String)
    func setMovieDescriptionLabel(_ text: String)
    func setDateLabel(_ text: String)
    func setAccessibilityIdentifiers()
}

final class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleYearLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView! {
                didSet {
                    movieImage.layer.cornerRadius = 6
                }
            }
    
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
  
    var cellPresenter: MovieListTableViewCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
}

extension MovieListTableViewCell: MovieListTableViewCellProtocol {
    
    func setMovieImage(_ imageUrl: URL) {
        movieImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder_movie_poster"))
    }
    
    func setTitleYearLabel(_ text: String) {
        titleYearLabel.text = text
    }
    
    func setMovieDescriptionLabel(_ text: String) {
        movieDescriptionLabel.text = text
    }
    
    func setDateLabel(_ text: String) {
        dateLabel.text = text
    }
    
}

extension MovieListTableViewCell {
    
    func setAccessibilityIdentifiers() {
        movieImage.accessibilityIdentifier = "listCellMovieImage"
        titleYearLabel.accessibilityIdentifier = "listCellTitleYearLabel"
        movieDescriptionLabel.accessibilityIdentifier = "listCellMovieDescriptionLabel"
        dateLabel.accessibilityIdentifier = "listCellDateLabel"
    }
    
}
