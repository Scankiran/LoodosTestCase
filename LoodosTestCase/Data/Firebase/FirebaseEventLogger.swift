//
//  FirebaseEventLogger.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation
import FirebaseAnalytics

class FirebaseEventLogger {
    
    class func logMovieInformation(movieModel: MovieModel) {
        Analytics.logEvent("movie_detail_screen_viewed", parameters: [
            "id": movieModel.imdbID,
            "title" : movieModel.title,
            "year" : movieModel.year,
            "imdbRating" : movieModel.imdbRating,
            "plot" : movieModel.plot
        ])
        
        
    }
}
