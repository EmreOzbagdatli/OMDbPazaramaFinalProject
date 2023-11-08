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
    private let titleLabel = UILabel()
    private let yearLabel = UILabel()
    private let imdbRating = UILabel()
    private let actors = UILabel()
    private let directorLabel = UILabel()

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        return stackView
    }()

    let viewModel = DetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        reloadData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupImageView()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        setupScrollViewAndStackView()
        setupPosterImage()
        setupTitleLabel()
        setupYearLabel()
        setupActorsLabel()
        setupTypeLabel()
        setupDirectorLabel()
        setupImdbRating()
        setupFavButton()
    }

    private func setTexts() {
        if let movieDetail = viewModel.moviesDetail {
            title = "\(movieDetail.title)"
            titleLabel.text = "Title: \(movieDetail.title)"
            yearLabel.text = "Year: \(movieDetail.year)"
            actors.text = "Actors: \(movieDetail.actors)"
            typeLabel.text = "Desc: \(movieDetail.plot)"
            imdbRating.text = "Rating: \(movieDetail.imdbRating)"
            directorLabel.text = "Director: \(movieDetail.plot)"

            if let imageURL = URL(string: movieDetail.poster) {
                posterImage.kf.setImage(with: imageURL)
            }
        }
    }

    private func setupScrollViewAndStackView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        ])
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setupPosterImage() {
        posterImage.contentMode = .scaleAspectFit
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(posterImage)
        NSLayoutConstraint.activate([
            posterImage.heightAnchor.constraint(equalToConstant: 300),
            posterImage.widthAnchor.constraint(equalToConstant: 200),
            ])
    }

    private func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)
        
    }

    private func setupYearLabel() {
        yearLabel.translatesAutoresizingMaskIntoConstraints = false
        yearLabel.textAlignment = .center
        stackView.addArrangedSubview(yearLabel)
        

    }

    private func setupActorsLabel() {
        actors.translatesAutoresizingMaskIntoConstraints = false
        actors.textAlignment = .center
        stackView.addArrangedSubview(actors)
        

    }

    private func setupTypeLabel() {
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.textAlignment = .center
        typeLabel.numberOfLines = 0
        stackView.addArrangedSubview(typeLabel)
        
    }

    private func setupDirectorLabel() {
        directorLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(directorLabel)
        directorLabel.textAlignment = .center
    }

    private func setupImdbRating() {
        imdbRating.translatesAutoresizingMaskIntoConstraints = false
        imdbRating.textAlignment = .center
        stackView.addArrangedSubview(imdbRating)
        
    }

    private func setupFavButton() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didFavButtonTapped))
        favButton.image = UIImage(systemName: "heart")
        favButton.tintColor = .white
        favButton.addGestureRecognizer(gesture)
        favButton.isUserInteractionEnabled = true
        favButton.backgroundColor = .systemBlue
        favButton.layer.cornerRadius = 10
        favButton.contentMode = .scaleAspectFit
        favButton.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(favButton)

        NSLayoutConstraint.activate([
            favButton.heightAnchor.constraint(equalToConstant: 35),
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
        isFavorited = favMovies.contains(where: { $0 == movieID })

        favButton.image = isFavorited ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
    }

    private func buttonSaved() {
        var favMovies = UserDefaults.standard.stringArray(forKey: "favoriteMovies") ?? []
        isFavorited = favMovies.contains(where: { $0 == movieID })

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
