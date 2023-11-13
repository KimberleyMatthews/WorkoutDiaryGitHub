//
//  RegisterView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-10-27.
//

import Foundation
import SwiftUI

struct RegisterView: View {

    @ObservedObject var db: FirebaseConnection
    
    @State var name = ""
    @State var email = ""
    @State var password =  ""
    @State var confirmPassword = ""
    
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
            
            VStack(spacing: 30) {
                
                Image("diary").resizable()
                    .frame(width: geometry.size.width * 0.6,
                           height: geometry.size.height * 0.26,
                           alignment: .center).padding().colorInvert()
                
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
                        
                        let isSuccess = db.RegisterUser(email: email, password: password)
                        
                        if !isSuccess {
                            print("Failed to create account")
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
            }.frame(width: geometry.size.width, height: geometry.size.height).background(Color(hue: 0.803, saturation: 0.0, brightness: 0.608, opacity: 0.838))
            
        }
        }
    }

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(db: FirebaseConnection())
    }
}
