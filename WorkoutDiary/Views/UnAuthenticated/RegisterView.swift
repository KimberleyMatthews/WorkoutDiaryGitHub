//
//  RegisterView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var journalVM : JournalVM
    
    @State var name = ""
    @State var email = ""
    @State var password =  ""
    @State var confirmPassword = ""
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 30) {
                Text("Register an account")
                    .bold()
                    .font(.title)
                    .padding()
                
                VStack(spacing: 20) {
                    
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    TextField("Email address", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    SecureField("Password", text:
                                    $password).textFieldStyle(.roundedBorder)
                    SecureField("Confirm password", text:
                                    $confirmPassword).textFieldStyle(.roundedBorder)
                }.padding()
                
                Button(action: {
                    
                    if !name.isEmpty && !email.isEmpty && !password.isEmpty && password == confirmPassword {
                        
                        let requestData = RegisterRequest(name: name, email: email, password: password)
                        
                        Task {
                            
                            do {
                                let _ = try await journalVM.registerApi(requestData: requestData)
                            } catch {
                                print(error)
                            }
                        }
                        
                    }
                }, label: {
                    Text("Register")
                        .bold()
                        .padding()
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(9)
                })
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.456, brightness: 0.913, opacity: 0.838))
            }
        }
    }

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
