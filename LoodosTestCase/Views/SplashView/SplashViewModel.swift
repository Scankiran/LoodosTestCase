//
//  SplashViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import Foundation

class SplashViewModel {
    
    func fetchKeyFromConfig() -> String {
        let remoteConfig = RemoteConfigManager()
        return remoteConfig.fetchStringValue(with: "SplashScreenKey") ?? ""
    }
}
