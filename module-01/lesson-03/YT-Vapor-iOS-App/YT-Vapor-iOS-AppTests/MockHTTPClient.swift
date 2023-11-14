//
//  MockHTTPClient.swift
//  YT-Vapor-iOS-AppTests
//
//  Created by Mikaela Caron on 3/20/22.
//

import Foundation
@testable import YT_Vapor_iOS_App

final class MockHTTPClient: HTTPClientProtocol, Mockable {
    
    func fetch<T: Codable>(url: URL) async throws -> [T] {
        return loadJSON(filename: "SongResponse", type: T.self)
    }
    
    func sendData<T: Codable>(to url: URL, object: T, httpMethod: String) async throws {
        
    }
    
    func delete(at id: UUID, url: URL) async throws {
        
    }
}
