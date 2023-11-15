//
//  ListView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-03.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var db: FirebaseConnection
    
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
            
            NavigationStack {
                VStack {
                    
                    Text("Saved workouts")
                        .font(.title)
                        .bold()
                        .padding()
                    
                    if let userData = db.currentUserData {
                        
                        if userData.workouts.count < 1 {
                            Text("No workouts yet!")
                        } else {
                            List() {
                                ForEach(userData.workouts) { workout in
                                    Text(workout.name)
                                }
                            }.scrollContentBackground(.hidden)
                        }

                    } else {
                        Text("Unexpected error, please contact your administrator.")
                    }
                
                    NavigationLink(destination: AddEntryView(db: db), label: {
                        Text("Add Workout")
                            .bold().padding().foregroundColor(.black).background(.white).cornerRadius(9)
                    })
                    Button(action: {
                        db.LogOut()
                    }, label: {
                        Text("Log out")
                            .bold()
                            .padding()
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(9)})
                    
                }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.0, brightness: 0.608, opacity: 0.838))
                
            }
            }
        }// View ends
    }
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(db: FirebaseConnection())
        }
    }

