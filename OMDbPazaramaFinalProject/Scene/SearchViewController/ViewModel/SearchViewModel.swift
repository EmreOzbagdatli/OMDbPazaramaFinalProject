//
//  SearchViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import Foundation

class SearchViewModel {
    var movies: [MovieSearchResult.MovieInfo] = [] // Initialize the movies array

    func fetchMovies(completion: @escaping (Result<[MovieSearchResult.MovieInfo], NetworkError>) -> Void) {
        NetworkService.shared.fetchMovies { result in
            switch result {
            case .success(let movieSearchResult):
                // Assuming you want to update the movies array with the search results.
                self.movies = movieSearchResult.search
                print("denemex")
                completion(.success(movieSearchResult.search))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
