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

//        cell.textLabel?.text = viewModel.movies[indexPath.row].title
//        cell.textLabel?.text = viewModel.movies[indexPath.row].year
        
        cell.movieTitleLabel.text = viewModel.movies[indexPath.row].title
        cell.movieYearLabel.text = viewModel.movies[indexPath.row].year
        if let imageURL = URL(string: viewModel.movies[indexPath.row].poster) {
            cell.moviePoster.kf.setImage(with: imageURL)
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


