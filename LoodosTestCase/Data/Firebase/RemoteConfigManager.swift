//
//  RemoteConfigManager.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigManager {
    
    let settings: RemoteConfigSettings
    let remoteConfig: RemoteConfig
    
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
    
    
    
}
