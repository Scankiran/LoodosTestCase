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
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: ViewModel -
    private lazy var viewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    // MARK: Variables
    private var dataSource: TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeTableView()
        initializeSearchBar()
        bindViewModel()
    }


    private func bindViewModel() {
        
        viewModel.sendDataToView = { [weak self] (baseFilmModelData) in
            self?.dataSource?.updateDataSource(baseFilmModelData: baseFilmModelData)
            self?.tableView.reloadData()
        }
    }

}


// MARK: Initialize UI Components
private extension MainViewController {
    
    func initializeTableView() {
        tableView.registerCell(BaseFilmInformationCell.self)
        
        dataSource = TableViewDataSource()
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.keyboardDismissMode = .onDrag
    }
    
    func initializeSearchBar() {
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.returnKeyType = .search
    }
    
    func closeKeyboard() {
        self.view.endEditing(true)
    }
}


// MARK: Search Bar Delegate
extension MainViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.searchFilm(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        self.closeKeyboard()
        self.dataSource?.updateDataSource(baseFilmModelData: [])
        self.tableView.reloadData()
    }
    
    
}
