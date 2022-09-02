//
//  SceneDelegate.swift
//  PhotoApp
//
//  Created by Nick Spravtsev on 02.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarViewController = PhotoTabBarController()
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
    }
}

