//
//  ContentView.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/8/22.
//

import SwiftUI

struct DrawingContentView: View {
    
    
    @ObservedObject var manager = DrawingManager()
    @State private var addNewShown = false
    
    var body: some View {
      //  NavigationView {
            List {
                ForEach(manager.docs) { doc in
                    NavigationLink(destination: DrawingWrapper(manager: manager, id: doc.id),
                    label: { Text(doc.name) })
                }.onDelete(perform: manager.delete)
            }.navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Let's draw!"){
                self.addNewShown.toggle()
            })
            .sheet(isPresented: $addNewShown, content: {
                AddNewDocument(manager: manager, addShown: $addNewShown)
            })
        
     //   }
    }
}

struct DrawingContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingContentView()
    }
}




