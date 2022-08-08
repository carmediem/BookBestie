//
//  AddNewDrawing.swift
//  BookBestie
//
//  Created by Yvana Pham on 8/8/22.
//

import SwiftUI

struct AddNewDocument: View {
    @ObservedObject var manager: DrawingManager
    @State private var documentName: String = ""
    @Binding var addShown: Bool
    
    var body: some View {
        VStack {
            //Text("Enter document name:")
            
            TextField("Enter chapter or sketch name here...", text: $documentName, onCommit: {
                save(fileName: documentName)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Create") {
                save(fileName: documentName)
            }
        }.padding()
    }
    
    private func save(fileName: String) {
        manager.addData(doc: DrawingDocument(id: UUID(), data: Data(), name: fileName))
        addShown.toggle()
    }
}

