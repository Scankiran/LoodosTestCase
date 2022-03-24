//
//  MainViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 25.03.2022.
//

import UIKit

class MainViewController: UIViewController {

    private lazy var viewModel: MainViewModel = {
        return MainViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }


    private func bindViewModel() {
        print(viewModel.temp)
    }

}
