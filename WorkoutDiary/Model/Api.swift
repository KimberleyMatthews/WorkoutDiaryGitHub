//
//  Api.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation

/*class Api {
    
    let endpoint = "http://192.71.151.213/iad22"
    
    // Post function starts
    
    // enconde/decode-function is made to be able to fetch anything
    func post<T: Encodable, R: Decodable>(endpoint: String, requestData: T?, token: String?) async throws -> R {
        
        guard let url = URL(string: endpoint) else {throw APIErrors.indvalidURL}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let requestData = requestData {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let encoder = JSONEncoder()
            
            do {
                request.httpBody = try encoder.encode(requestData)
            } catch {
                throw APIErrors.invalidRequestData
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
       
        guard let httpReponse = response as? HTTPURLResponse, httpReponse.statusCode >= 200 && httpReponse.statusCode < 205 else {
            throw APIErrors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let decodedResponse = try decoder.decode(R.self, from: data)
            
            return decodedResponse
            
        } catch {
            throw APIErrors.invalidResponseData
        }
    } // Post function ends
    
    func get<R: Decodable>(endpoint: String, token: String?) async throws -> R {
        
        guard let url = URL(string: endpoint) else {throw APIErrors.indvalidURL}
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIErrors.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(R.self, from: data)
        } catch {
            throw APIErrors.invalidResponseData
        }
        
    }
}
    
enum APIErrors: Error {
        case indvalidURL
        case invalidResponse
        case invalidRequestData
        case invalidResponseData
}*/
