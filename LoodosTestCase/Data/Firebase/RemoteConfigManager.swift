//
//  RemoteConfigManager.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigManager {
    
    private let settings: RemoteConfigSettings
    private let remoteConfig: RemoteConfig
    
    init() {
        settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        
        remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = settings
    }
    
    func fetchStringValue(with key: String) -> String? {
        let value = remoteConfig.configValue(forKey: key).stringValue
        return value
    }
    
    deinit {
        print("remote config manager de init")
    }
    
    
    
}
