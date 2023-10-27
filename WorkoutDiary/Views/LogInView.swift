//
//  LogInView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
import SwiftUI

struct LogInView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(alignment: .center, spacing: 30) {
                
                Image("diary").resizable()
                    .frame(width: geometry.size.width * 0.6,
                           height: geometry.size.height * 0.28,
                           alignment: .center).padding()
                
                Text("Welcome to your workout journal!")
                    .bold()
                    .font(.system(size: 24)).padding(.bottom, geometry.size.height * 0.02)
                
                VStack(alignment: .leading) {
                    Text("Enter your credentials").font(.title3).bold()
                    
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
                })
                
            }
            
        }
        
        Text("Enter your credentials").bold().font(.title)
        
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
