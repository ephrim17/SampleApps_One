//
//  WebService.swift
//  SampleApp_SwiftUI
//
//  Created by ephrim.daniel on 19/03/25.
//

import Foundation

final class WebService {
    
    static func getData <G: Codable>(type: G.Type) async throws -> [G] {
        
        let urlString = "https://digitalassets-taa-uat.cdn-apple.com/qa/en/us/testTranscript1.md"
        guard let url = URL(string: urlString) else {
            throw UserError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw UserError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([G].self, from: data)
        } catch {
            throw UserError.invalidData
        }
    }
}

enum UserError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case custom(error: Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
            
        case .invalidResponse:
            return "Invalid Response"
            
        case .invalidData:
            return "Invalid data"
            
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
