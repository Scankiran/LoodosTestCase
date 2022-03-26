//
//  MovieDetailViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import Foundation

class MovieDetailViewModel {
    
    private lazy var network = MovieAPINetwork()
    var movieID = ""
    
    var sendMovieDetailToView: ((MovieModel)->())?
    
    
    func fetchMovieDetail() {
        network.getMovieDetail(with: movieID) { [weak self] movieDetailModel in
            self?.sendMovieDetailToView?(movieDetailModel)
            FirebaseEventLogger.logMovieInformation(movieModel: movieDetailModel)
        }
    }
    
}
