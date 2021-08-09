//
//  SceneDelegate.swift
//  CleanTodoList
//
//  Created by Guye Raphael, I233 on 31.05.21.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
//            runUIKitExample(on: window)
            runSwiftUIExample(on: window)
            
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    private func runUIKitExample(on window: UIWindow) {
        let viewController = RootViewController()
        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
    }
    
    private func runSwiftUIExample(on window: UIWindow) {
        let rootView = UIHostingController(rootView: RootView())
        window.rootViewController = rootView
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

