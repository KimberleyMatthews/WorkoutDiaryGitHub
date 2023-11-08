//
//  LogInView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
import SwiftUI

struct LogInView: View {
    
    @EnvironmentObject var journalVM: JournalVM
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(alignment: .center, spacing: 30) {
                
                Image("diary").resizable()
                    .frame(width: geometry.size.width * 0.6,
                           height: geometry.size.height * 0.28,
                           alignment: .center).padding()
                
                Text("Welcome to your workout diary!")
                    .bold()
                    .font(.system(size: 24)).padding(.bottom, geometry.size.height * 0.02)
                
                VStack(alignment: .leading) {
                    Text("Enter your email and passsword").font(.title3).bold()
                    
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text:
                                    $password).textFieldStyle(.roundedBorder)
                }.padding()
                
                Button(action: {
                    
                    if !email.isEmpty && !password.isEmpty {
                        
                        let requestData  = LoginRequest(email: email, password: password)
                        
                        Task {
                            // if success
                            do {
                                let _ = try await journalVM.loginApi(requestData: requestData)
                            // if no success
                            } catch {
                                print(error)
                            }
                        }
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
                NavigationLink(destination: RegisterView(), label: {
                    Text("Register account").bold().foregroundColor(.black).italic()
                })
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.456, brightness: 0.913))
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
