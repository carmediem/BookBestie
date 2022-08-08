//
//  LoginView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/3/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            ZStack {
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
              //  Spacer()
                
                NavigationLink(destination: ContentView()) {
                    Text("Lets go!")
                      //  .frame(width: UIScreen.main.bounds.width - 4)
                        .frame(width: 150, height: 10)
                        .padding()
                        .foregroundColor(.white)
                        .background(.cyan)
                        .cornerRadius(40)
                        .font(.title3)
                }
            }
        }
    }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
