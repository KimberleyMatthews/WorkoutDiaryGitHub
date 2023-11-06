//
//  JournalVM.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-03.
//

import Foundation
import KeychainSwift

class JournalVM: ObservableObject {
    
    let api = Api()
    let keychain = KeychainSwift()
    
    @Published var journals: [JournalEntry] = []
    @Published var token: String?
    
    init() {
        self.token = keychain.get("token")
    }
    
    // Login function
    func loginApi(requestData: LoginRequest) async throws -> AuthResponse {
        
        do {
            let response: AuthResponse = try await api.post(endpoint: "\(api.endpoint)/login", requestData: requestData, token: nil)
            
            DispatchQueue.main.async {
                self.token = response.token
            }
            
            keychain.set(response.token, forKey: "token")
            
            return response
        } catch {
            throw error
        }
        
    }// login func ends
    
    // Register function
    func registerApi(requestData: RegisterRequest) async throws -> AuthResponse {
        
        do {
            let response: AuthResponse = try await api.post(endpoint: "\(api.endpoint)/register", requestData: requestData, token: nil)
            
            self.token = response.token
            keychain.set(response.token, forKey: "token")
            
            return response
        } catch {
            throw error
        }
        
    } // Register func ends}
    
    func getEntries() async throws {
        
        if let token = token {
            
            do {
                let response: [JournalEntry] = try await api.get(endpoint: "\(api.endpoint)/journals", token: token)
                
                DispatchQueue.main.async {
                    self.journals = response
                }
                
            } catch {
                throw error
            }
            
        } else {
            throw APIErrors.invalidRequestData
        }
    } // func getEntries ends
}
