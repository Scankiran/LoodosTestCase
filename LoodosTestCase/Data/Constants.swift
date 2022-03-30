//
//  Constants.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 30.03.2022.
//

import Foundation

class Constants {

    static let shared = Constants()
    
    let splashScreenConfigKey = "SplashScreenKey"

    func fetchConstantString(_ key: ConstantStringKey) -> String {
        return constantStrings[key.rawValue] ?? "No Constant String Key"
    }

    func fetchConstantString(_ key: ConstantStringKey, with parameter: String?) -> String {
        return constantStrings[key.rawValue]?.replacingOccurrences(of: "%", with: parameter.asStringOrEmpty()) ?? "No Constant String Key"
    }

    private let constantStrings: [String: String] = [
        "errorRemoteConfig": "There was an error on fetching remote config.",
        "connectionError": "There is no connection. Check your connection.",
        "year": "Year: %",
        "runtime": "Runtime: %",
        "genre": "Genre: %",
        "director": "Director: %",
        "actors": "Actors: %",
        "metascore": "Metascore: %",
        "languages": "Languages: %",
        "IMDBRating": "IMDB Rating: %",
        "awards": "Awards: %"
    ]
}

enum ConstantStringKey: String {
    case errorRemoteConfig
    case connectionError
    case year
    case runtime
    case genre
    case director
    case actors
    case metascore
    case languages
    case IMDBRating
    case awards
}
