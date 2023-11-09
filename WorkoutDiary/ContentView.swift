//
//  ContentView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-20.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var journalVM: JournalVM

    var body: some View {
      
        VStack {
            if journalVM.token != nil {
                NavigationStack {
                    ListView()
                }
            } else {
                NavigationStack {
                    LogInView()
                }
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(JournalVM())
            
    }
}
