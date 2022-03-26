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
    
    func fillTheView(movieDetail: MovieModel) {
        if let posterURL = URL(string: movieDetail.poster) {
            imageViewMoviePoster.kf.setImage(with: posterURL)
        }
        
        labelMovieTitle.text = movieDetail.title
        labelMoviePlot.text = movieDetail.plot
        
        labelYear.text = "Year: \(movieDetail.year)"
        labelRuntime.text = "Runtime: \(movieDetail.runtime)"
        labelGenres.text = "Genre: \(movieDetail.genre)"
        labelDirector.text = "Director: \(movieDetail.director)"
        labelActors.text = "Actors: \(movieDetail.actors)"
        labelMetascore.text = "Metascore: \(movieDetail.metascore)"
        labelLanguages.text = "Languages: \(movieDetail.language)"
        labelIMDBRating.text = "IMDB Rating: \(movieDetail.imdbRating)"
        labelAwards.text = "Awards: \(movieDetail.awards)"
        
    }
}
