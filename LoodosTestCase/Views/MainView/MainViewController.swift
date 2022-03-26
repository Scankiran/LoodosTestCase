//
//  MainViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: Outlets -
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: ViewModel -
    private lazy var viewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    // MARK: Variables
    private var dataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        bindViewModel()
    }


    private func bindViewModel() {
        
        viewModel.sendDataToView = { [weak self] (baseFilmModelData) in
            self?.dataSource?.updateDataSource(baseFilmModelData: baseFilmModelData)
            self?.tableView.reloadData()
        }
        
        viewModel.searchFilm(with: "up")
        
    }

}

private extension MainViewController {
    
    func initializeTableView() {
        tableView.registerCell(BaseFilmInformationCell.self)
        
        dataSource = TableViewDataSource()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
    }
}
