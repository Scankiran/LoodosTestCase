//
//  MovieDetailViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit
import ProgressHUD

class MovieDetailViewController: UIViewController {

    // MARK: Outlets -
    @IBOutlet private weak var imageViewMoviePoster: UIImageView!
    @IBOutlet private weak var labelMovieTitle: UILabel!
    @IBOutlet private weak var labelMoviePlot: UILabel!
    @IBOutlet private weak var labelYear: UILabel!
    @IBOutlet private weak var labelRuntime: UILabel!
    @IBOutlet private weak var labelGenres: UILabel!
    @IBOutlet private weak var labelDirector: UILabel!
    @IBOutlet private weak var labelActors: UILabel!
    @IBOutlet private weak var labelMetascore: UILabel!
    @IBOutlet private weak var labelLanguages: UILabel!
    @IBOutlet private weak var labelIMDBRating: UILabel!
    @IBOutlet private weak var labelAwards: UILabel!

    // MARK: View Model
    private lazy var viewModel: MovieDetailViewModel = {
        return MovieDetailViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    private func bindViewModel() {

        viewModel.sendMovieDetailToView = { [weak self] (movieDetail) in
            self?.fillTheView(movieDetail: movieDetail)
        }
        
    }

    func setMovieIDToViewModel(movieID: String) {
        self.viewModel.movieID = movieID
    }
}


private extension MovieDetailViewController {

    func fillTheView(movieDetail: DetailedMovieModel) {
        if let poster = movieDetail.poster,
            let posterURL = URL(string: poster) {
            imageViewMoviePoster.kf.setImage(with: posterURL)
        }

        labelMovieTitle.text = movieDetail.title
        labelMoviePlot.text = movieDetail.plot

        labelYear.text = Constants.shared.fetchConstantString(.year, with: movieDetail.year)
        labelRuntime.text = Constants.shared.fetchConstantString(.runtime, with: movieDetail.runtime)
        labelGenres.text = Constants.shared.fetchConstantString(.genre, with: movieDetail.genre)
        labelDirector.text = Constants.shared.fetchConstantString(.director, with: movieDetail.director)
        labelActors.text = Constants.shared.fetchConstantString(.actors, with: movieDetail.actors)
        labelMetascore.text = Constants.shared.fetchConstantString(.metascore, with: movieDetail.metascore)
        labelLanguages.text = Constants.shared.fetchConstantString(.languages, with: movieDetail.language)
        labelIMDBRating.text = Constants.shared.fetchConstantString(.IMDBRating, with: movieDetail.imdbRating)
        labelAwards.text = Constants.shared.fetchConstantString(.awards, with: movieDetail.awards)

        adjustLabelVisualProperties()
        
        ProgressHUD.dismiss()
    }

    func adjustLabelVisualProperties() {
        let labels: [UILabel] = [labelYear, labelRuntime, labelGenres, labelDirector, labelActors, labelMetascore, labelLanguages, labelIMDBRating, labelAwards]

        for label in labels {
            if let textHeight = label.text?.height(withConstrainedWidth: label.bounds.width, font: label.font), textHeight > 21 {
                label.heightAnchor.constraint(equalToConstant: textHeight).isActive = true
            }
        }
    }

}
