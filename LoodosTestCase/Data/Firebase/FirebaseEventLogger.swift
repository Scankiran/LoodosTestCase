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
            "Id": movieModel.imdbID,
            "Title" : movieModel.title,
            "Year": movieModel.year,
            "Runtime": movieModel.runtime,
            "Genre": movieModel.genre,
            "Director": movieModel.director,
            "Actors": movieModel.actors,
            "Metascore": movieModel.metascore,
            "Languages": movieModel.language,
            "IMDB Rating": movieModel.imdbRating,
            "Awards": movieModel.awards
        ])
    }
    
    class func logErrorMessage(message: String) {
        Analytics.logEvent("network_error", parameters: [
            "error_message" : message
        ])
    }
}
