//
//  FavoriteViewModelTests.swift
//  OMDbPazaramaFinalProjectTests
//
//  Created by Emre Ozbagdatli on 8.11.2023.
//

import XCTest
@testable import OMDbPazaramaFinalProject

final class FavoriteViewModelTests: XCTestCase {

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

    func testAPIReturnsSuccess_FavoriteViewShowsData() {
        let sut = MockFavoriteViewModel(movies: [])
        sut.networkService = MockService()
        let expectation = expectation(description: "")

        sut.fetchMovies(by: "", completionHandler: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 3)
        XCTAssertEqual(sut.movies.first?.title, "First Title")
    }

}

final class MockFavoriteViewModel: FavoriteViewModelProtocol {
    func getFavorites() {

    }
    var networkService: OMDbPazaramaFinalProject.NetworkServiceProtocol?

    var delegate: OMDbPazaramaFinalProject.FavoriteViewProtocol?

    var movies: [OMDbPazaramaFinalProject.MovieDetail]

    func fetchMovies(by id: String, completionHandler: @escaping () -> Void) {
        networkService?.fetchMovies(by: "", completion: { result in
            switch result {
            case .success(let detail):
                self.movies.append(detail)
                completionHandler()
            case .failure(let error):
                print(error)
            }
        })
    }

    init(delegate: OMDbPazaramaFinalProject.FavoriteViewProtocol? = nil, movies: [OMDbPazaramaFinalProject.MovieDetail]) {
        self.delegate = delegate
        self.movies = movies
    }

}
