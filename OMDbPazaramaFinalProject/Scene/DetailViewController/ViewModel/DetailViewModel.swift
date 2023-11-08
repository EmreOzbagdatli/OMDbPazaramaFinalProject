//
//  DetailViewModel.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 8.11.2023.
//

import Foundation

final class DetailViewModel {
    
    var moviesDetail : [MovieDetail] = []
    
    func fetchMoviesDetail(id:String,completion:@escaping()->Void){
        self.moviesDetail.removeAll()
        NetworkService.shared.fetchMovies(by: id) { [weak self] result in
            switch result{
            case.success(let movie):
                self?.moviesDetail.append(movie)
                completion()
            case.failure(_):
                completion()
            }
        
            
        }
    }
}
