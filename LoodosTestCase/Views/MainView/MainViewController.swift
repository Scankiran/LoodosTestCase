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


    //MARK: Bind View Model
    private func bindViewModel() {

        viewModel.sendDataToView = { [weak self] (baseMovieModelData) in
            self?.dataSource?.updateDataSource(baseMovieModelData: baseMovieModelData)
            self?.tableView.reloadData()
        }
    }
}


// MARK: Initialize UI Components
private extension MainViewController {

    func initializeTableView() {
        tableView.registerCell(BaseMovieInformationCell.self)

        dataSource = TableViewDataSource(outputDelegate: self)
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

// MARK: TableViewDataSourceOutputDelegate -
extension MainViewController: TableViewDataSourceOutputDelegate {

    func openMovieDetailPage(with imdbID: String) {
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.setMovieIDToViewModel(movieID: imdbID)
        self.present(movieDetailViewController, animated: true, completion: nil)
    }
}


// MARK: Search Bar Delegate -
extension MainViewController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.viewModel.searchMovie(with: searchText)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text?.removeAll()
        self.closeKeyboard()
        self.dataSource?.updateDataSource(baseMovieModelData: [])
        self.tableView.reloadData()
    }

}
