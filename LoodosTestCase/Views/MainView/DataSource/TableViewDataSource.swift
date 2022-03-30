//
//  TableViewDataSource.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import FirebaseAnalytics

protocol TableViewDataSourceOutputDelegate: AnyObject {
    func openMovieDetailPage(with imdbID:String)
}

class TableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    private var baseMovieModelData: [BaseMovieModel] = []
    private weak var outputDelegate: TableViewDataSourceOutputDelegate? = nil

    init(outputDelegate: TableViewDataSourceOutputDelegate) {
        self.outputDelegate = outputDelegate
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
        self.outputDelegate?.openMovieDetailPage(with: movieID)
    }
}
