//
//  MainViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import Foundation

class MainViewModel {
 
    var sendDataToView: (([BaseFilmModel]) -> ())?
    
    func searchFilm(with text:String) {
        let network = FilmAPINetwork()
        network.searchFilm(with: text) { [weak self] filmData in
            self?.sendDataToView?(filmData.search)
        }
    }
}
