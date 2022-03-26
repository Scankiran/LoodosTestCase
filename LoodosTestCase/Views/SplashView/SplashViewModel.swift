//
//  SplashViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit

class SplashViewModel {

    var showAlertOnView: ((String) -> ())?
    var sendDataToView: ((String) -> ())?
    var openMainViewController: (() -> ())?

    func fetchKeyFromConfig() {
        let remoteConfig = RemoteConfigManager()

        if let keyValue = remoteConfig.fetchStringValue(with: "SplashScreenKey") {
            self.sendDataToView?(keyValue)
            runTimerToPushMainView()
        } else {
            self.showAlertOnView?("There was an error on fetching remote config.")
        }
    }

    func checkInternetConnection() -> Bool {
        if Reachability.isConnectedToNetwork() {
            return true
        } else {
            self.showAlertOnView?("There is no connection. Check your connection.")
            return false
        }
    }

}


//MARK: Internal Functions
private extension SplashViewModel {
    
    private func runTimerToPushMainView() {
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(openMainView), userInfo: nil, repeats: false)
    }

    @objc private func openMainView() {
        self.openMainViewController?()
    }
}
