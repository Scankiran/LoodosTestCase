//
//  MainViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import Foundation

class MainViewModel {
    private let network = FilmAPINetwork()
    
    var sendDataToView: (([BaseFilmModel]) -> ())?
    
    func searchFilm(with text:String) {
        network.searchFilm(with: text) { [weak self] filmData in
            if let filmData = filmData.search {
                self?.sendDataToView?(filmData)
            }
        }
    }
}
