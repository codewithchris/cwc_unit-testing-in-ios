//
//  AddUpdateSongViewModelTests.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by ヒットり on 11/14/23.
//

import XCTest
@testable import YT_Vapor_iOS_App

final class AddUpdateSongViewModelTests: XCTestCase {
    
    var addUpdateSongVM: AddUpdateSongViewModel!

    override func setUp() {
        super.setUp()
        addUpdateSongVM = AddUpdateSongViewModel(httpClient: MockHTTPClient())
    }
    
    override func tearDown() {
        super.tearDown()
        addUpdateSongVM = nil
    }
    
    func testNoEmptySongCanBeAdded() {
        addUpdateSongVM.songTitle = "LALISA"
        XCTAssertTrue(addUpdateSongVM.isValidSong(), "The song must be valid")
    }
    
    func testWhiteSpaceSongFails() {
        addUpdateSongVM.songTitle = "      "
        XCTAssertFalse(
            addUpdateSongVM.isValidSong(), 
            "The song should not be valid"
        )
    }
}
