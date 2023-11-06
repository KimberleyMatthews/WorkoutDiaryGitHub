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
        
        VStack(spacing: 30) {
            Text("Register an accound").bold().font(.title).padding()
            
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
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(9)
            })
        }
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}