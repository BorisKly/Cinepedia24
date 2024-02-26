//
//  SceneDelegate.swift
//  Cinepedia24
//
//  Created by Borys Klykavka on 23.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
     
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let startVC = StartRouter.createModule()
        window.makeKeyAndVisible()
        window.rootViewController = startVC
        self.window = window
        
    }

}

