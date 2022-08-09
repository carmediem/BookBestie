//
//  SplashScreen.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/3/22.
//

import SwiftUI

struct SplashScreen: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
                
            } else {
                
            Color("background").edgesIgnoringSafeArea(.all)
                VStack {
                Text("Hello BookBestie")
                    . font(.largeTitle)
                    .bold()
                    .padding(.bottom, 40)
            
                    Image("bookbestie8")
                    .resizable()
                    .frame(width: 190, height: 190)
                    .padding(.bottom, 45)
                
                Text("Lets find our next favorite book 📖")
                    .font(.title3)
                    .bold()
                    .padding(.bottom, 120)
                }
            }
        }.onAppear(perform: splashScreen)
    }
    func splashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation {
        self.isActive = true
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
