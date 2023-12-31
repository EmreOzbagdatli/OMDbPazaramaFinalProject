//
//  MovieSearchResult.swift
//  OMDbPazaramaFinalProject
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import Foundation

struct MovieSearchResult: Codable {
    struct MovieInfo: Codable {
        let title: String
        let year: String
        let imdbID: String
        let type: String
        let poster: String
        

        enum CodingKeys: String, CodingKey {
            case title = "Title"
            case year = "Year"
            case imdbID
            case type = "Type"
            case poster = "Poster"
        }
    }

    var search: [MovieInfo]?

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }

    var totalResults: String?
    var response: String?
}
