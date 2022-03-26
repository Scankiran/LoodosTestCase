//
//  MovieDetailViewController.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit

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

        viewModel.fetchMovieDetail()
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
        
        labelYear.text = "Year: \(movieDetail.year.asStringOrEmpty())"
        labelRuntime.text = "Runtime: \(movieDetail.runtime.asStringOrEmpty())"
        labelGenres.text = "Genre: \(movieDetail.genre.asStringOrEmpty())"
        labelDirector.text = "Director: \(movieDetail.director.asStringOrEmpty())"
        labelActors.text = "Actors: \(movieDetail.actors.asStringOrEmpty())"
        labelMetascore.text = "Metascore: \(movieDetail.metascore.asStringOrEmpty())"
        labelLanguages.text = "Languages: \(movieDetail.language.asStringOrEmpty())"
        labelIMDBRating.text = "IMDB Rating: \(movieDetail.imdbRating.asStringOrEmpty())"
        labelAwards.text = "Awards: \(movieDetail.awards.asStringOrEmpty())"
        
    }
}
