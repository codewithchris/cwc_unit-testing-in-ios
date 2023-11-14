//
//  SongListViewModelTests.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Mikaela Caron on 3/20/22.
//

import Combine
import XCTest
@testable import YT_Vapor_iOS_App

class SongListViewModelTests: XCTestCase {
    
    var songListVM: SongListViewModel!
    
    private var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        songListVM = SongListViewModel(httpClient: MockHTTPClient())
        cancellables = []
    }
    
    override func tearDown() {
        super.tearDown()
        songListVM = nil
        cancellables = []
    }
    
    func testFetchSongsSuccessfully() async throws {
        
        let expectation = XCTestExpectation(description: "Fetched Songs")
        
        try await songListVM.fetchSongs()
        
        songListVM
            .$songs
            .dropFirst()
            .sink { value in
                XCTAssertEqual(value.count, 2)
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
    }
}
