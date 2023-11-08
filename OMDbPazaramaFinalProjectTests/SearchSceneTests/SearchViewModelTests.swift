//
//  SearchViewModelTests.swift
//  OMDbPazaramaFinalProjectTests
//
//  Created by Emre Özbağdatlı on 8.11.2023.
//

import XCTest
@testable import OMDbPazaramaFinalProject

final class SearchViewModelTests: XCTestCase {

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
    
    func test_APIReturnsFailure_SearchViewShowsData() {
        let sut = MockSearchViewModel()
        sut.networkService = MockService()
        let expectation = expectation(description: "")
        
        sut.fetchMovies(by: "") {
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(sut.movies.first?.title, nil)
    }
}

final class MockSearchViewModel: SearchViewModelProtocol {
    var movies: [OMDbPazaramaFinalProject.MovieSearchResult.MovieInfo] = []
    
    var networkService: OMDbPazaramaFinalProject.NetworkServiceProtocol?
    
    func resetPageIndex() {  }
    
    func incrementPageIndex() {  }
    
    func fetchMovies(by title: String, completion: @escaping () -> Void) {
        networkService?.fetchMovies(by: "", pageIndex: 0, completion: { result in
            switch result {
            case .failure(let error):
                print(error)
                completion()
            case .success(let data):
                print(data)
                completion()
            }
        })
    }
    
    
}
