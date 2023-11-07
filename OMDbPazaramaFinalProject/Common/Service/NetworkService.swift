//
//  APIManager.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 7.11.2023.
//
import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidData
    case decodeError

    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidData:
            return "Invalid Data"
        case .decodeError:
            return "Decoding Error"
        }
    }
}


class NetworkService {
    static let shared = NetworkService()
    private init() { }

    func fetchMovies(completion: @escaping (Result<MovieSearchResult, NetworkError>) -> Void) {
        if let url = URL(string: "\(URLConstant.baseURL)\(URLConstant.searchBarText)&apikey=\(URLConstant.apiKey)") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    completion(.failure(.requestFailed))
                    return
                }

                guard let data = data else {
                    print("data false")
                    completion(.failure(.invalidData))
                    return
                }

                do {
                    let movies = try JSONDecoder().decode(MovieSearchResult.self, from: data)
                    completion(.success(movies))
                    print("moviews")
                } catch {
                    print("Decoding Error: \(error)")
                    completion(.failure(.decodeError))
                }
            }.resume()
        }
    }
}
