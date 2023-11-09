//
//  ListView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-03.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var journalVM: JournalVM
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                Text("Workout diary")
                    .font(.title)
                    .bold()
                
                NavigationLink(destination: AddEntryView(), label: {
                    Text("Add workout")
                        .bold()
                })
                
                List() {
                    ForEach(journalVM.journals) {journal in
                        Text(journal.title)
                    }
                }// List() ends
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.456, brightness: 0.913, opacity: 0.838))
                
                .task {
                    do {
                        try await journalVM.getEntries()
                    } catch {
                        print(error)
                    }
                }
        }// View ends
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView().environmentObject(JournalVM())
        }
    }
}
