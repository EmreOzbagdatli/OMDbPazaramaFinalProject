//
//  SearchViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import Foundation

protocol SearchViewModelDelegate: AnyObject {
    func searchViewModel(_ viewModel: SearchViewModel, didFetchMovies movies: [MovieSearchResult.MovieInfo])
}

protocol SearchViewModelProtocol {
    var movies: [MovieSearchResult.MovieInfo] { get set }
    
    func resetPageIndex()
    func incrementPageIndex()
    func fetchMovies(by title: String, completion: @escaping () -> Void)
}

final class SearchViewModel: SearchViewModelProtocol {
    
    var movies: [MovieSearchResult.MovieInfo] = []
    var networkService: NetworkServiceProtocol
    
    weak var delegate: SearchViewModelDelegate?
    
    private var pageIndex: Int = 1
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
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
                self.delegate?.searchViewModel(self, didFetchMovies: self.movies)
            case .failure(let error):
                print(error)
                completion()
            }
        }
    }
}
