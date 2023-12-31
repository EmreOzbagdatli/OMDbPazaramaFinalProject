//
//  FavouriteView+Extension.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import UIKit

extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! SearchListCell
        
        if let movie = viewModel?.movies[indexPath.row] {
            cell.movieTitleLabel.text = movie.title
            cell.movieYearLabel.text = movie.year
            if let imageURL = URL(string: movie.poster) {
                cell.moviePoster.kf.setImage(with: imageURL)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            var favMovies = UserDefaults.standard.stringArray(forKey: "favoriteMovies") ?? []
            if let currentMovie = viewModel?.movies[indexPath.row] {
                favMovies.removeAll(where: { favMovies in
                    favMovies == currentMovie.imdbID
                })
                viewModel?.movies.removeAll { movie in
                    movie.imdbID == currentMovie.imdbID
                }
                UserDefaults.standard.setValue(favMovies, forKey: "favoriteMovies")
                tableView.reloadData()
            }
            
        }
    }
}

