//
//  MainViewModel.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import UIKit

class MainViewModel {

    // MARK: Private Properties
    private let network = MovieAPINetwork()
    private var searchTimer: Timer?
    
    // MARK: Public Properties
    var isSearchMode: Bool = false

    //MARK: Closures
    var sendDataToView: (([BaseMovieModel]) -> ())?


    func searchMovie(with text: String) {
        
        if text != "", !text.isEmpty {
            isSearchMode = true
            
            if searchTimer != nil {
                searchTimer?.invalidate()
                searchTimer = nil
            }

            searchTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(searchForKeyword(_:)), userInfo: text, repeats: false)
        }
    }

    func getPermissionForNotification(delegate: UNUserNotificationCenterDelegate) {
            // 1
            UNUserNotificationCenter.current().delegate = delegate
            // 2
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
              options: authOptions) { _, _ in }
            // 3
            UIApplication.shared.registerForRemoteNotifications()
    }
    
}

//MARK: Internal Functions
private extension MainViewModel {
    
    @objc func searchForKeyword(_ timer: Timer) {
        let searchText = timer.userInfo as! String

        network.searchMovie(with: searchText) { [weak self] movieData in
            if let movieData = movieData.search {
                self?.sendDataToView?(movieData)
            }
        }
    }
    
}
