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
            VStack {
                Text("Hello BookBestie!")
                    . font(.title)
                Text("Lets find our next favorite book 📖")
                    .font(.title3)
                NavigationLink(destination: ContentView()) {
                    Text("Get Started")
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
