//
//  BaseMovieInformationCell.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import Kingfisher
import ProgressHUD

protocol BaseMovieInformationCellOutputDelegate: AnyObject {
    func cellTapped(movieID: String)
}

class BaseMovieInformationCell: BaseTableViewCell {

    @IBOutlet private weak var imageViewMoviePoster: UIImageView!
    @IBOutlet private weak var labelMovieTitle: UILabel!
    @IBOutlet private weak var labelMovieYear: UILabel!
    
    private let activityIndicator = UIActivityIndicatorView()
    weak var outputDelegate: BaseMovieInformationCellOutputDelegate?

    
    func configureCell(baseMovieModel: BaseMovieModel) {

        fetchMoviePoster(url: baseMovieModel.poster)

        labelMovieTitle.text = baseMovieModel.title
        labelMovieYear.text = baseMovieModel.year

        handleTap(movieModel: baseMovieModel)
    }

    func handleTap(movieModel: BaseMovieModel) {
        self.contentView.onTap { _ in
            self.outputDelegate?.cellTapped(movieID: movieModel.imdbID)
        }
    }

    override func prepareForReuse() {
        imageViewMoviePoster.image = nil
    }
    
}

// MARK: Private UI Extension
private extension BaseMovieInformationCell {
    func showLoaderAnimation() {
        self.imageViewMoviePoster.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: imageViewMoviePoster.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imageViewMoviePoster.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
    }
    
    func hideLoaderAnimation() {
        self.activityIndicator.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
    func fetchMoviePoster(url:String) {
        if let url = URL(string: url) {
            showLoaderAnimation()
            imageViewMoviePoster.kf.setImage(with: url) { result in
                self.hideLoaderAnimation()
                
                switch result {
                case .success(let imageResult):
                    self.imageViewMoviePoster.image = imageResult.image
                case .failure(let error):
                    self.imageViewMoviePoster.image = UIImage(named: "no_image_placeholder")
                    print(error.localizedDescription)
                }
            }
        }
    }
}
