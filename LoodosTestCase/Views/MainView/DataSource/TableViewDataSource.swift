//
//  TableViewDataSource.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit

class TableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {

    private var baseFilmModelData: [BaseFilmModel] = []

    override init() {
    }

    func updateDataSource(baseFilmModelData: [BaseFilmModel]) {
        self.baseFilmModelData = baseFilmModelData
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return baseFilmModelData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.generateReusableCell(BaseFilmInformationCell.self, indexPath: indexPath)
        
        cell.configureCell(baseFilmModel: baseFilmModelData[indexPath.row])
        cell.outputDelegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

}

// MARK: BaseFilmInformationCellOutputDelegate
extension TableViewDataSource: BaseFilmInformationCellOutputDelegate {
    func cellTapped(filmID: String) {
        print(filmID)
    }
    
    
}
