//
//  TableViewDataSource.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import FirebaseAnalytics

class TableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    private var baseMovieModelData: [BaseMovieModel] = []

    override init() {
    }

    func updateDataSource(baseMovieModelData: [BaseMovieModel]) {
        self.baseMovieModelData = baseMovieModelData
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseMovieModelData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.generateReusableCell(BaseMovieInformationCell.self, indexPath: indexPath)
        
        cell.configureCell(baseMovieModel: baseMovieModelData[indexPath.row])
        cell.outputDelegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}

// MARK: BaseMovieInformationCellOutputDelegate
extension TableViewDataSource: BaseMovieInformationCellOutputDelegate {
    func cellTapped(movieID: String) {

    }
    
    
}
