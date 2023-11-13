//
//  WorkoutDiaryApp.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-20.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct WorkoutDiaryApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // all the views inside ContentView will have access to this  class
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
