//
//  SplashViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit

class SplashViewController: UIViewController {

    private lazy var viewModel: SplashViewModel = {
        return SplashViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel.fetchKeyFromConfig())
        // Do any additional setup after loading the view.
    }

}
