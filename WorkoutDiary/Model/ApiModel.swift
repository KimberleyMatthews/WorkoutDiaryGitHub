//
//  ApiModel.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
// login
struct LoginRequest: Encodable {
    var email: String
    var password: String
    }
// register
struct RegisterRequest: Encodable {
    var name: String
    var email: String
    var password: String
}

struct AuthResponse: Decodable {
    var success: Bool
    var message: String
    var token: String
}

struct JournalEntry: Codable, Identifiable {
    var id: String?
    var title: String
    var content: String
    var date: String
    var userIds: [String]
    
    enum CodingKeys: String, CodingKey {
        case title, content, date, userIds
        case id = "_id"
    }
}


