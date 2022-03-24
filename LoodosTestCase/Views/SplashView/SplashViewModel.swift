//
//  SplashViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit
//import Reachability

class SplashViewModel {

    var showAlertOnView: ((String) -> ())?
    var sendDataToView: ((String) -> ())?


    func fetchKeyFromConfig() {
        let remoteConfig = RemoteConfigManager()

        if let keyValue = remoteConfig.fetchStringValue(with: "SplashScreenKey") {
            self.sendDataToView?(keyValue)
        } else {
            self.showAlertOnView?("There was an error on fetching remote config.")
        }
    }

    func checkInternetConnection() -> Bool {
        if Reachability.isConnectedToNetwork(){
            return true
        }else{
            self.showAlertOnView?("There is no connection. Check your connection.")
            return false
        }
    }
}
