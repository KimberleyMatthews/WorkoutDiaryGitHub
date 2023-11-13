//
//  UserData.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-13.
//

import Foundation
import FirebaseFirestoreSwift

struct UserData: Codable {
    @DocumentID var id: String?
    var workouts: [Workout]
    
}
