//
//  NoteView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import SwiftUI

struct NoteView: View {
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var note: Note
    
    @State private var noteContent: String = ""
    
    
    var body: some View {
            TextEditor(text: $noteContent)
                .padding()
                .frame(maxHeight: .infinity)
                .navigationTitle(note.title ?? "")
                .onAppear {
                    noteContent = note.content ?? ""
                }
                .toolbar {
                    Button("Save") {
                        note.content = noteContent
                        try? viewContext.save()
                    }
                }
        }
    }



