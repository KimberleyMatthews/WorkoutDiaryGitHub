//
//  SplashScreenView.swift
//  WorkoutDiary
//
//  Created by STI Mac 9 on 2023-11-08.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @StateObject var journalVM = JournalVM()
    
    var body: some View {
        
            if isActive {
                ContentView().environmentObject(journalVM)
                
            } else {
                VStack{
                    VStack{
                        Image("dumbell")
                            .font(.system(size:80))
                        Text("Workout Diary")
                            .font(Font.custom("Baskerville-Bold", size: 26))
                            .foregroundColor(.black.opacity(0.80))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
