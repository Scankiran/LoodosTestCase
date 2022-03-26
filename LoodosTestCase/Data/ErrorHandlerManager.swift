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

    class func showErrorMessage(err: AFError) {
        print(err.localizedDescription)
        if err.isResponseSerializationError {
            ProgressHUD.showError("No Movie", image: nil, interaction: true)
            return
        }
        
        ProgressHUD.showError(err.localizedDescription, image: nil, interaction: true)
        
    }
    
    class func showErrorMessage(message: String) {
        print(message)
        
        ProgressHUD.showError(message, image: nil, interaction: true)
        
    }
}
