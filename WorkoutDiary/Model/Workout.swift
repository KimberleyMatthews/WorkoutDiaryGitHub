//
//  Workout.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-13.
//

import Foundation
import FirebaseFirestoreSwift

struct Workout: Identifiable, Codable {
    
    var id = UUID()
    var name: String
    var content: String
    var date: String

}
