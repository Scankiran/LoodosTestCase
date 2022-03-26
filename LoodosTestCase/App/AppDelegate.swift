//
//  AppDelegate.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit
import Firebase
import FirebaseRemoteConfig


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Firebase
        FirebaseApp.configure()
        Firebase.Analytics.setAnalyticsCollectionEnabled(true)
        
        loadAndShowSplashView()
        return true
    }
}


private extension AppDelegate {

    func loadAndShowSplashView() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let splashViewController = SplashViewController()
        
        window.rootViewController = splashViewController
        window.makeKeyAndVisible()
        self.window = window
    }
}

