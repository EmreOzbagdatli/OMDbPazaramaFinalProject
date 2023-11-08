//
//  DetailViewController.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import UIKit
import Kingfisher

final class DetailViewController: UIViewController {

    var movieID: String!
    
    private var isFavorited = false
    private let favButton = UIImageView()
    private let posterImage = UIImageView()
    private let typeLabel = UILabel()
    private let imdbLabel = UILabel()
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        displayMovieDetails()
        reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageView()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "Movie Details"
    }
    
    private func setTexts() {
        titleLabel.text = viewModel.moviesDetail.actors

        yearLabel.text = viewModel.moviesDetail.year

        imdbLabel.text = viewModel.moviesDetail.imdbID

        typeLabel.text = viewModel.moviesDetail.title
        
        if let imageURL = URL(string: viewModel.moviesDetail.poster) {
            posterImage.kf.setImage(with: imageURL)
        }
    }

    private func displayMovieDetails() {
        titleLabel.textAlignment = .center
        yearLabel.textAlignment = .center
        imdbLabel.textAlignment = .center
        typeLabel.textAlignment = .center
        

        let gesture = UITapGestureRecognizer(target: self, action: #selector(didFavButtonTapped))
        favButton.image = UIImage(systemName: "heart")
        favButton.tintColor = .systemBlue
        favButton.addGestureRecognizer(gesture)
        favButton.isUserInteractionEnabled = true
        favButton.backgroundColor = .lightGray
        favButton.layer.cornerRadius = 10
        favButton.contentMode = .scaleAspectFit
        
        view.addSubview(titleLabel)
        view.addSubview(yearLabel)
        view.addSubview(posterImage)
        view.addSubview(typeLabel)
        view.addSubview(imdbLabel)
        view.addSubview(favButton)

        posterImage.contentMode = .scaleAspectFit

        favButton.translatesAutoresizingMaskIntoConstraints = false
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
            imdbLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            favButton.topAnchor.constraint(equalTo: imdbLabel.bottomAnchor, constant: 100),
            favButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            favButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            favButton.heightAnchor.constraint(equalToConstant: 80)
            ])
        
    }
    
    private func reloadData() {
        viewModel.fetchMoviesDetail(id: movieID) { [weak self] in
            DispatchQueue.main.async {
                self?.setTexts()
            }
        }
    }
    
    private func setupImageView() {
        let favMovies = UserDefaults.standard.stringArray(forKey: "favoriteMovies") ?? []
        isFavorited = favMovies.contains(where: {$0 == movieID})

        favButton.image = isFavorited ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }
    
    private func buttonSaved() {
        var favMovies = UserDefaults.standard.stringArray(forKey: "favoriteMovies") ?? []
        isFavorited = favMovies.contains(where: {$0 == movieID})
        
        isFavorited.toggle()

        if isFavorited {
            favButton.image = UIImage(systemName: "heart.fill")
            if !favMovies.contains(movieID) {
                favMovies.append(movieID)
            }

        } else {
            favButton.image = UIImage(systemName: "heart")
            favMovies.removeAll { movie in
                movieID == movie
            }
        }
        UserDefaults.standard.setValue(favMovies, forKey: "favoriteMovies")

    }
    @objc func didFavButtonTapped() {
        buttonSaved()
    }
}
