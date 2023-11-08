//
//  NetworkServiceAdapter.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 8.11.2023.
//

import Foundation

class NetworkServiceAdapter: NetworkServiceProtocol {
    func fetchMovies(by title: String, pageIndex: Int, completion: @escaping (Result<MovieSearchResult, NetworkError>) -> Void) {
        NetworkService.shared.fetchMovies(by: title, pageIndex: pageIndex, completion: completion)
    }

    func fetchMovies(by id: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        NetworkService.shared.fetchMovies(by: id, completion: completion)
    }
}
