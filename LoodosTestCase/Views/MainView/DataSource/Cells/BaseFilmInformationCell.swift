//
//  BaseFilmInformationCell.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import Kingfisher

protocol BaseFilmInformationCellOutputDelegate: AnyObject {
    func cellTapped(filmID: String)
}

class BaseFilmInformationCell: BaseTableViewCell {

    @IBOutlet private weak var imageViewFilmPoster: UIImageView!
    @IBOutlet private weak var labelFilmTitle: UILabel!
    @IBOutlet private weak var labelFilmYear: UILabel!

    weak var outputDelegate: BaseFilmInformationCellOutputDelegate?

    func configureCell(baseFilmModel: BaseFilmModel) {

        if let url = URL(string: baseFilmModel.poster) {
            imageViewFilmPoster.kf.setImage(with: url, placeholder: UIImage(named: "no_image_placeholder"))
        }

        labelFilmTitle.text = baseFilmModel.title
        labelFilmYear.text = baseFilmModel.year

        handleTap(filmModel: baseFilmModel)
    }

    func handleTap(filmModel: BaseFilmModel) {
        self.contentView.onTap { _ in
            self.outputDelegate?.cellTapped(filmID: filmModel.imdbID)
        }
    }



    override func prepareForReuse() {
        imageViewFilmPoster.image = nil
    }
}
