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


    //Creates a search request 0.8 seconds after typing in the searchBar is finished.
    func searchMovie(with movieName: String) {

        if movieName != "", !movieName.isEmpty {
            isSearchMode = true

            // To delay creating search movie request. This prevent unnecessary network calls.
            if searchTimer != nil {
                searchTimer?.invalidate()
                searchTimer = nil
            }
            searchTimer = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(searchForKeyword(_:)), userInfo: movieName, repeats: false)
        }
    }

    // Get notification permission from user.
    func getPermissionForNotification(delegate: UNUserNotificationCenterDelegate) {
        UNUserNotificationCenter.current().delegate = delegate

        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { _, _ in
        }
        UIApplication.shared.registerForRemoteNotifications()
    }

}

//MARK: Internal Functions
private extension MainViewModel {

    //
    @objc func searchForKeyword(_ timer: Timer) {
        let searchText = timer.userInfo as! String

        network.searchMovie(with: searchText) { [weak self] movieData in
            if let movieData = movieData.search {
                self?.sendDataToView?(movieData)
            }
        }
    }

}
