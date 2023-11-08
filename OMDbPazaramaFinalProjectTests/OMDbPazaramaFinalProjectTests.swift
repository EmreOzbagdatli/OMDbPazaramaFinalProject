//
//  OMDbPazaramaFinalProjectTests.swift
//  OMDbPazaramaFinalProjectTests
//
//  Created by Emre Özbağdatlı on 6.11.2023.
//

import XCTest
@testable import OMDbPazaramaFinalProject

final class MockService: NetworkServiceProtocol {
    func fetchMovies(by title: String, pageIndex: Int, completion: @escaping (Result<MovieSearchResult, NetworkError>) -> Void) {
        completion(.failure(NetworkError.decodeError))
    }
    
    func fetchMovies(by id: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        completion(.success(MovieDetail(title: "First Title", year: "2000", runtime: "", genre: "", director: "", writer: "", actors: "", plot: "", poster: "", imdbRating: "", imdbID: "")))
    }
}


final class OMDbPazaramaFinalProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
