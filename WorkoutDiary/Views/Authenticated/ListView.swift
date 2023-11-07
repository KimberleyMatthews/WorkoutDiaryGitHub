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
        VStack {
            Text("Journals").font(.title).bold().padding()
        
            NavigationLink(destination: AddEntryView(), label: {
                Text("Add workout").bold()
            })
            
            List() {
                ForEach(journalVM.journals) {journal in
                    Text(journal.title)
                }
            }// List() ends
        }.task {
            do {
                try await journalVM.getEntries()
            } catch {
                print(error)
            }
        }// View ends
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView().environmentObject(JournalVM())
    }
}
