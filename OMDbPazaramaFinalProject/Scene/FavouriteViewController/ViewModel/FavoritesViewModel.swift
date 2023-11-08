//
//  FavoritesViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//

import Foundation


final class FavoritesViewModel {
    
    var detailMovies : [MovieDetail] = []
    
    func fetchMovies(id:String,completion:@escaping()->Void){
        self.detailMovies.removeAll()
        NetworkService.shared.fetchMovies(by: id) { [weak self] result in
            switch result{
            case.success(let movie):
                self?.detailMovies.append(movie)
                completion()
            case.failure(let error):
                print(error)
                completion()
            }
        }
    }
}
