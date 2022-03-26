//
//  MainViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import Foundation

class MainViewModel {

    // MARK: Private Properties
    private let network = FilmAPINetwork()
    private var searchTimer: Timer?
    
    // MARK: Public Properties
    var isSearchMode: Bool = false

    //MARK: Closures
    var sendDataToView: (([BaseFilmModel]) -> ())?


    func searchFilm(with text: String) {
        
        if text != "", !text.isEmpty {
            isSearchMode = true
            
            if searchTimer != nil {
                searchTimer?.invalidate()
                searchTimer = nil
            }

            searchTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(searchForKeyword(_:)), userInfo: text, repeats: false)
        }
    }


    @objc private func searchForKeyword(_ timer: Timer) {
        let searchText = timer.userInfo as! String

        network.searchFilm(with: searchText) { [weak self] filmData in
            if let filmData = filmData.search {
                self?.sendDataToView?(filmData)
            }
        }
    }

}
