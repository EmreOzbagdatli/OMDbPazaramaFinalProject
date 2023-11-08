//
//  NetworkServiceProtocol.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 8.11.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchMovies(by title: String, pageIndex: Int, completion: @escaping (Result<MovieSearchResult, NetworkError>) -> Void)
    func fetchMovies(by id: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void)
}
