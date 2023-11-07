//
//  SearchView+UITableView.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import UIKit
import Kingfisher

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell") as! SearchListCell

        let movie = viewModel.movies[indexPath.row]
        
        cell.movieTitleLabel.text = movie.title
        cell.movieYearLabel.text = movie.year
        if let imageURL = URL(string: movie.poster) {
            cell.moviePoster.kf.setImage(with: imageURL)
        }
        
        if movie.imdbID == viewModel.movies.last?.imdbID {
            viewModel.incrementPageIndex()
            viewModel.fetchMovies(by: searchText) { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = viewModel.movies[indexPath.row]

        let detailViewController = DetailViewController()
        detailViewController.selectedMovie = selectedMovie
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
}


