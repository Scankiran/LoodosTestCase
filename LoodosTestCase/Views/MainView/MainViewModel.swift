//
//  MainViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import Foundation

class MainViewModel {
 
    let temp = "Temp text"
    
    func searchFilm(with text:String) {
        let network = FilmAPINetwork()
        network.searchFilm(with: text) { filmData in
            print(filmData)
        }
    }
}
