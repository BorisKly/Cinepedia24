//
//  MovieBannerCollectionViewCell.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 26.02.2024.
//

import UIKit

protocol MovieBannerCollectionViewCellProtocol: AnyObject {
    func setBannerImage(_ imageUrl: URL)
    func setbannerTitle(_ text: String)
    func setAccessibilityIdentifiers()
}

final class MovieBannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!{
        didSet {
            bannerImage.layer.cornerRadius = 12
        }
    }
    @IBOutlet weak var bannerTitleLabel: UILabel!
    
    var cellPresenter: MovieBannerCollectionViewCellPresenterProtocol! {
        didSet {
            cellPresenter.load()
        }
    }
    
}

extension MovieBannerCollectionViewCell: MovieBannerCollectionViewCellProtocol {
    
    func setBannerImage(_ imageUrl: URL) {
        bannerImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder_movie_poster"))
    }
    
    func setbannerTitle(_ text: String) {
        bannerTitleLabel.text = text
    }
    
}

extension MovieBannerCollectionViewCell {
    func setAccessibilityIdentifiers() {
        bannerImage.accessibilityIdentifier = "bannerImage"
        bannerTitleLabel.accessibilityIdentifier = "bannerTitleLabel"
    }
}
