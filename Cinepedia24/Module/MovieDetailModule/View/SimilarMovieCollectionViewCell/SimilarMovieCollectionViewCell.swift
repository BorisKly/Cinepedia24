//
//  SimilarMovieCollectionViewCell.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import UIKit
import SDWebImage

protocol SimilarMovieCollectionViewCellProtocol: AnyObject {
    func setMoviePoster(_ imageUrl: URL)
    func setTitleYearLabel(_ text: String)
    func setAccessibilityIdentifiers()
}

final class SimilarMovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var moviePosterImage: UIImageView! {
        didSet {
            moviePosterImage.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var titleDateLabel: UILabel!
    
    var cellPresenter: SimilarMovieCollectionViewCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
}

extension SimilarMovieCollectionViewCell: SimilarMovieCollectionViewCellProtocol {
    
    func setMoviePoster(_ imageUrl: URL) {
        moviePosterImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder_movie_poster"))
    }
    
    func setTitleYearLabel(_ text: String) {
        titleDateLabel.text = text
    }
    
}

extension SimilarMovieCollectionViewCell {
    func setAccessibilityIdentifiers() {
        moviePosterImage.accessibilityIdentifier = "detailCellMoviePosterImage"
        titleDateLabel.accessibilityIdentifier = "detailCellMovieTitleLabel"
    }
}
