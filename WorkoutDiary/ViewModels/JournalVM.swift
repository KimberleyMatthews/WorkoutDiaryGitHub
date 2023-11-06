//
//  JournalVM.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-03.
//

import Foundation

class JournalVM: ObservableObject {
    
    let api = Api()
    
    @Published var journals: [JournalEntry] = []
    @Published var token: String?
    
    // Login function
    func loginApi(requestData: LoginRequest) async throws -> AuthResponse {
        
        do {
            let response: AuthResponse = try await api.post(endpoint: "\(api.endpoint)/login", requestData: requestData)
            
            self.token = response.token
            
            return response
        } catch {
            throw error
        }
        
    }// login func ends
    
    // Register function
    func registerApi(requestData: RegisterRequest) async throws -> AuthResponse {
        
        do {
            let response: AuthResponse = try await api.post(endpoint: "\(api.endpoint)/register", requestData: requestData)
            
            self.token = response.token
            
            return response
        } catch {
            throw error
        }
        
    } // Register func ends}
}
