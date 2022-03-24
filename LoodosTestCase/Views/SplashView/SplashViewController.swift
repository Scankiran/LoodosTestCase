//
//  SplashViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 24.03.2022.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: Outlets -
    @IBOutlet private weak var labelViewTitle: UILabel!
    
    // MARK: View Model -
    private lazy var viewModel: SplashViewModel = {
        return SplashViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    // ViewModel Bind
    private func bindViewModel() {
        
        viewModel.showAlertOnView = { [weak self] (message) in
            self?.showErrorAlert(alertMessage: message)
        }
        
        viewModel.sendDataToView = { [weak self] (textData) in
            self?.setDataToLabel(text: textData)
        }
        
        viewModel.openMainViewController = { [weak self] () in
            self?.openMainViewController()
        }
        
        fetchDataFromConfig()
    }

}

// MARK: UI Functions
private extension SplashViewController {
    
    func fetchDataFromConfig() {
        viewModel.checkInternetConnection() ? viewModel.fetchKeyFromConfig() : nil
    }
    
    func setDataToLabel(text: String) {
        self.labelViewTitle.text = text
    }

    func showErrorAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Error!", message: alertMessage, preferredStyle: .alert)
        
        alert.addAction(.init(title: "Okey", style: .cancel, handler: { [weak self] _ in
            self?.fetchDataFromConfig()
        }))
        self.present(alert, animated: true)
    }
    
    func openMainViewController() {
        let viewController = MainViewController()
        viewController.modalPresentationStyle = .fullScreen
        self.present(viewController, animated: true, completion: nil)
    }
}
