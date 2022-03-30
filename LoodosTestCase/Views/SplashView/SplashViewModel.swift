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
    
    // Fetch remote config
    func fetchKeyFromConfig() {
        let remoteConfig = RemoteConfigManager()

        if let keyValue = remoteConfig.fetchStringValue(with: Constants.shared.splashScreenConfigKey) {
            self.sendDataToView?(keyValue)
            runTimerToPushMainView()
        } else {
            self.showAlertOnView?(Constants.shared.fetchConstantString(.errorRemoteConfig))
        }
    }

    /**
     This function check device internet connection. If there is, return true
    - Returns if connected,  true
     */
    func checkInternetConnection() -> Bool {
        if Reachability.isConnectedToNetwork() {
            return true
        } else {
            self.showAlertOnView?(Constants.shared.fetchConstantString(.connectionError))
            return false
        }
    }

}


//MARK: Internal Functions
private extension SplashViewModel {
    
    // 3 second timer to open main page.
    private func runTimerToPushMainView() {
        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(openMainView), userInfo: nil, repeats: false)
    }

    @objc private func openMainView() {
        self.openMainViewController?()
    }
}
