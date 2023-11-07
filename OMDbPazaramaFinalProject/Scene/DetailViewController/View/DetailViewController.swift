//
//  DetailViewController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var selectedMovie: MovieSearchResult.MovieInfo?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayMovieDetails()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Movie Details"
    }

    private func displayMovieDetails() {
        if let movie = selectedMovie {
            let titleLabel = UILabel()
            titleLabel.text = movie.title
            titleLabel.textAlignment = .center

            let yearLabel = UILabel()
            yearLabel.text = movie.year
            yearLabel.textAlignment = .center

            let imdbLabel = UILabel()
            imdbLabel.text = movie.imdbID
            imdbLabel.textAlignment = .center

            let typeLabel = UILabel()
            typeLabel.text = movie.type
            typeLabel.textAlignment = .center

            let posterImage = UIImageView()
            if let imageURL = URL(string: movie.poster) {
                posterImage.kf.setImage(with: imageURL)
            }

            view.addSubview(titleLabel)
            view.addSubview(yearLabel)
            view.addSubview(posterImage)
            view.addSubview(typeLabel)
            view.addSubview(imdbLabel)



            posterImage.contentMode = .scaleAspectFit
            posterImage.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            yearLabel.translatesAutoresizingMaskIntoConstraints = false
            imdbLabel.translatesAutoresizingMaskIntoConstraints = false
            typeLabel.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([

                posterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
                posterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                posterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                posterImage.heightAnchor.constraint(equalToConstant: 150),

                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 50),
                titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                yearLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                yearLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
                yearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                yearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                typeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                typeLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
                typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                imdbLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imdbLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 20),
                imdbLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imdbLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
        }
    }
}
