//
//  SearchViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import Foundation

class SearchViewModel {
    var movies: [MovieSearchResult.MovieInfo] = []

    
    private var pageIndex: Int = 1
    func incrementPageIndex() {
        pageIndex += 1
    }
    
    func resetPageIndex() {
        pageIndex = 1
        self.movies.removeAll()
    }

    func fetchMovies(by title: String, completion: @escaping () -> Void) {
        NetworkService.shared.fetchMovies(by: title, pageIndex: pageIndex) { result in
            switch result {
            case .success(let movieSearchResult):
                if let search = movieSearchResult.search {
                    self.movies.append(contentsOf: search)
                }
                completion()
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
}
