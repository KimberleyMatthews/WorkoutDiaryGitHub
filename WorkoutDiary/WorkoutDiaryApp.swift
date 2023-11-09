//
//  WorkoutDiaryApp.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-20.
//

import SwiftUI

@main
struct WorkoutDiaryApp: App {
    
    @StateObject var journalVM = JournalVM()
    // all the views inside ContentView will have access to this  class
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
            ContentView()
                .environmentObject(journalVM)
        }
    }
}
