//
//  AddEntryView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-07.
//

import SwiftUI

struct AddEntryView: View {
    
    @EnvironmentObject var journalVM: JournalVM
    
    @State var title = ""
    @State var content = ""
    @State var date = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack{
                Image("chalkHands")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
                    .opacity(1.0)
            }
            VStack {
                
                Image("diary").resizable()
                    .frame(width: geometry.size.width * 0.6,
                           height: geometry.size.height * 0.26,
                           alignment: .center).padding().colorInvert()
                
                Text("Add new workout").font(.title).bold()
                
                VStack {
                    TextField("Title", text: $title).textFieldStyle(.roundedBorder)
                    TextField("Content", text: $content).textFieldStyle(.roundedBorder)
                    TextField("Date", text: $date).textFieldStyle(.roundedBorder)
                    
                }.padding()
    
                Button(action: {
                    
                    let newEntry = JournalEntry(title: title, content: content, date: date, userIds: [])
                    
                    Task {
                        
                        do {
                            try await journalVM.saveEntry(entry: newEntry)
                        } catch {
                            print(error)
                        }
                    }
                }, label: {
                    Text("Save")
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(9)
                })
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.0, brightness: 0.608, opacity: 0.838))
            
        }
    }
}
    
    struct AddEntryView_Previews: PreviewProvider {
        static var previews: some View {
            AddEntryView()
        }
    }

