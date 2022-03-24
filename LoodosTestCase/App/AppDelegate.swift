//
//  AppDelegate.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadAndShowSplashView()
        return true
    }
}


private extension AppDelegate {

    func loadAndShowSplashView() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: SplashViewController())
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }
}

