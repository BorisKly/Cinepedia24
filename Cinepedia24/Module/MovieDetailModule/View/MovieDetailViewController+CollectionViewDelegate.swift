//
//  MovieDetailViewController+CollectionViewDelegate.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 27.02.2024.
//

import UIKit

extension MovieDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItemsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: SimilarMovieCollectionViewCell.self, for: indexPath)
        if let similarMovie = presenter.similarMovie(indexPath.row) {
            cell.cellPresenter = SimilarMovieCollectionViewCellPresenter(view: cell, movie: similarMovie)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItemAt(index: indexPath.row)
    }
}
