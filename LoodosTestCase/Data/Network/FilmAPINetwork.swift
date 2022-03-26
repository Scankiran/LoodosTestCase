//
//  FilmAPINetwork.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation
import Alamofire
import ProgressHUD

class FilmAPINetwork {

    private let baseUrl = "http://www.omdbapi.com/"
    private let apiKey = "6d07ab49"


    func searchFilm(with name: String, completion: @escaping ((SearchResultModel) -> Void)) {
        ProgressHUD.show()

        let parameters: [String: String] = [
            "apiKey": apiKey,
            "s": name
        ]
        print(parameters)
        
        AF.request(baseUrl,
            method: .get,
            parameters: parameters).responseDecodable(of: SearchResultModel.self, completionHandler: { result in

            if let responseValue = result.value {
                if let error = responseValue.error {
                    ErrorHandlerManager.showErrorMessage(message: error)
                    return
                }
                ProgressHUD.dismiss()
                completion(responseValue)
            }
        })
    }

    func getFilmDetail(with imdbId: String, completion: @escaping ((FilmModel) -> Void)) {
        ProgressHUD.show()

        let parameters: [String: String] = [
            "apiKey": apiKey,
            "i": imdbId
        ]
        
        AF.request(baseUrl,
            method: .get,
            parameters: parameters).responseDecodable(of: FilmModel.self, completionHandler: { result in

            if let responseValue = result.value {
                ProgressHUD.dismiss()
                completion(responseValue)

            }
        })
    }


    func killOtherRequest() {
        AF.session.getTasksWithCompletionHandler({ dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
        })
    }

}

