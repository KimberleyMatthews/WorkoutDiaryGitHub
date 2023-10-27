//
//  Api.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation

class Api {
    
    let endpoint = "http://192.71.151.213/iad22"
    
    // Login function
    
    func loginApi(requestData: LoginRequest) async throws -> AuthResponse {
        
        guard let url = URL(string: "\(endpoint)/login") else {throw APIErrors.indvalidURL}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let encoder = JSONEncoder()
        // omvandlar allt till SnakeCase
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        do {
            // success = encode request to JSOON and puts in body
            request.httpBody = try encoder.encode(requestData)
        } catch {
            // if failure
            throw APIErrors.invalidData
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpReponse = response as? HTTPURLResponse, httpReponse.statusCode == 200 else {
            throw APIErrors.invalidResponse
        }
        
        do {
            
        } catch {
            
        }
    }
   
    
}
    
enum APIErrors: Error{
        case indvalidURL
        case invalidResponse
        case invalidData
}
