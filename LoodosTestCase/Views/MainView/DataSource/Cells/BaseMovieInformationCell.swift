//
//  BaseMovieInformationCell.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import Kingfisher

protocol BaseMovieInformationCellOutputDelegate: AnyObject {
    func cellTapped(movieID: String)
}

class BaseMovieInformationCell: BaseTableViewCell {

    @IBOutlet private weak var imageViewMoviePoster: UIImageView!
    @IBOutlet private weak var labelMovieTitle: UILabel!
    @IBOutlet private weak var labelMovieYear: UILabel!

    weak var outputDelegate: BaseMovieInformationCellOutputDelegate?

    func configureCell(baseMovieModel: BaseMovieModel) {

        if let url = URL(string: baseMovieModel.poster) {
            imageViewMoviePoster.kf.setImage(with: url, placeholder: UIImage(named: "no_image_placeholder"))
        }

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
