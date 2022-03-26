//
//  FirebaseEventLogger.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation
import FirebaseAnalytics

class FirebaseEventLogger {
    
    class func logFilmInformation(filmModel: FilmModel) {
        Analytics.logEvent("FilmDetailViewOpen", parameters: [
            "id": filmModel.imdbID,
            "title" : filmModel.title,
            "year" : filmModel.year,
            "imdbRating" : filmModel.imdbRating,
            "plot" : filmModel.plot
        ])
    }
}
