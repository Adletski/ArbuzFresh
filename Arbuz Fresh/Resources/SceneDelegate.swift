//
//  SceneDelegate.swift
//  Arbuz Fresh
//
//  Created by Adlet Zhantassov on 20.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: LoginViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

