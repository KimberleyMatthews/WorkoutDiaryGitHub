//
//  LogInView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
import SwiftUI

struct LogInView: View {
    
    @ObservedObject var db: FirebaseConnection
    
    @State var email = ""
    @State var password = ""
    
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
            
            VStack(alignment: .center, spacing: 30) {
                
                Image("diary").resizable()
                    .frame(width: geometry.size.width * 0.6,
                           height: geometry.size.height * 0.26,
                           alignment: .center).padding().colorInvert()
                
                Text("Welcome to your workout diary!")
                    .bold()
                    .font(.system(size: 22)).padding(.bottom, geometry.size.height * 0.02)
                
                VStack(alignment: .leading) {
                    Text("Enter your email and passsword")
                        .font(.title3)
                        .bold()
                    
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text:
                                    $password).textFieldStyle(.roundedBorder)
                }.padding()
                
                Button(action: {
                    
                    if !email.isEmpty && !password.isEmpty {
                        // Logga in användaren
                    }
                }, label: {
                    Text("Log in")
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(9)
                        
                })
                //Navigate from LoginView to RegisterView
                NavigationLink(destination: RegisterView(db: db), label: {
                    Text("Register account")
                        .bold()
                        .foregroundColor(.white)
                        .italic()
                })
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.0, brightness: 0.608, opacity: 0.838))
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView(db: FirebaseConnection())
    }
}
