//
//  ContentView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-20.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    
    @StateObject var db = FirebaseConnection()
    @State var workouts = [Workout]()
    
    var body: some View {
        
        if let User = db.currentUser {
            NavigationStack {
                ListView(db: db)
            }
        } else {
            NavigationStack {
                LogInView(db: db)
            }
        }
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(db: FirebaseConnection())
            
    }
}
