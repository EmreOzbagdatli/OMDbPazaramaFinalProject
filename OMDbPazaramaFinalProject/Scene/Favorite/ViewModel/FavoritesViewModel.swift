//
//  FavoritesViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import Foundation

protocol FavoriteViewModelProtocol: AnyObject {
    var delegate: FavoriteViewProtocol? { get set }
    var movies: [MovieDetail] { get set }
    
    var networkService: NetworkServiceProtocol? { get set }
    
    func fetchMovies(by id: String, completionHandler: @escaping () -> Void)
    func getFavorites()
}

final class FavoritesViewModel: FavoriteViewModelProtocol {
    
    var networkService: NetworkServiceProtocol?
    
    weak var delegate: FavoriteViewProtocol?
    
    var movies: [MovieDetail] = []
    
    init(networkService: NetworkServiceProtocol, delegate: FavoriteViewProtocol?) {
        self.networkService = networkService
        self.delegate = delegate
    }
    
    func fetchMovies(by id: String, completionHandler: @escaping () -> Void) {
        self.movies.removeAll()
        networkService?.fetchMovies(by: id) { [weak self] result in
            switch result{
            case.success(let movie):
                self?.movies.append(movie)
                completionHandler()
            case.failure(let error):
                print(error)
            }
        }
    }
    
    func getFavorites() {
        let selectedMovies = UserDefaults.standard.stringArray(forKey: "favoriteMovies") ?? []
        
        for movie in selectedMovies {
            self.fetchMovies(by: movie) { [weak self] in
                self?.delegate?.updateFavoritesList()
            }
        }
    }
}
