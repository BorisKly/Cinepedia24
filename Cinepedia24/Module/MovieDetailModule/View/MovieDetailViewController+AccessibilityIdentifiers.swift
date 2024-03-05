//
//  MovieDetailViewController+AccessibilityIdentifiers.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import Foundation

extension MovieDetailViewController {
    func setAccessibilityIdentifiers() {
        moviePosterImage.accessibilityIdentifier = "moviePosterImage"
        movieTitleLabel.accessibilityIdentifier = "movieTitleLabel"
        movieDescriptionTextView.accessibilityIdentifier = "movieDescriptionTextView"
        voteScoreLabel.accessibilityIdentifier = "voteScoreLabel"
        releaseDateLabel.accessibilityIdentifier = "releaseDateLabel"
        collectionView.accessibilityIdentifier = "detailCollectionView"
       // imdbAvaibleView.accessibilityIdentifier = "imdbAvaibleView"
       // addFavoritesButton.accessibilityIdentifier = "addFavoritesButton"
    }
}
