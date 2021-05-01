//
//  SceneDelegate.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 19.04.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let windowScene = scene
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let searchVC = SearchViewController()
        let listVC = ListViewController()
        let shopsVC = ShopsViewController()
        let profileVC = ProfileViewController()
        let cartVC = CartViewController()
        
        let searchNC = UINavigationController(rootViewController: searchVC)
        let listNC = UINavigationController(rootViewController: listVC)
        let shopsNC = UINavigationController(rootViewController: shopsVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        let cartNC = UINavigationController(rootViewController: cartVC)
        
        searchNC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        listNC.tabBarItem = UITabBarItem(title: "Мой список", image: UIImage(systemName: "bookmark"), tag: 1)
        shopsNC.tabBarItem = UITabBarItem(title: "Магазины", image: UIImage(named: "shop"), tag: 2)
        profileNC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 3)
        cartNC.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart"), tag: 4)
        

        window.overrideUserInterfaceStyle = .light
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(named: "tabBarSelected") ?? .green], for:.selected)
        UITabBar.appearance().tintColor = UIColor(named: "tabBarSelected")
        
        let tapBarVC = UITabBarController()
        tapBarVC.setViewControllers([searchNC, listNC, shopsNC, profileNC, cartNC], animated: true)
        window.windowScene = scene
        self.window?.rootViewController = tapBarVC
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

