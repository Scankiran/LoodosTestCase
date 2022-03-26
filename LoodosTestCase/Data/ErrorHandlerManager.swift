//
//  ErrorHandlerManager.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation
import ProgressHUD
import Alamofire

class ErrorHandlerManager {
    
    class func showErrorMessage(message: String) {
        print(message)
        ProgressHUD.showError(message, image: nil, interaction: false)
        FirebaseEventLogger.logErrorMessage(message: message)
    }
}
