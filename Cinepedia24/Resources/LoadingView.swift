//
//  LoadingView.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 24.02.2024.
//

import UIKit

class LoadingView {
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    static let shared = LoadingView()
    var blurView: UIVisualEffectView = UIVisualEffectView()

    private init() {
        configure()
    }

    func configure() {
        blurView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.backgroundColor = .gray
        blurView.alpha = 0.3
        blurView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        let blurViewCenter = CGPoint(x: blurView.bounds.midX, y: blurView.bounds.midY)
        let activityIndicatorSize = CGSize(width: 150, height: 150)
        activityIndicator.frame = CGRect(origin: CGPoint(x: blurViewCenter.x - activityIndicatorSize.width / 2,
                                                         y: blurViewCenter.y - activityIndicatorSize.height / 2),
                                         size: activityIndicatorSize)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        activityIndicator.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)

        blurView.contentView.addSubview(activityIndicator)
    }

    func startLoading() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let mainWindow = windowScene.windows.first else {
               return
           }
        mainWindow.addSubview(blurView)
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        blurView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
}
