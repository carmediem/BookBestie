//
//  BookNotesView.swift
//  BookBestie
//
//  Created by Carmen Chiu on 8/7/22.
//

import SwiftUI
import CoreData

struct BookNotesView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .linear)
    var notes: FetchedResults<Note>
    
    @State private var showAddNoteSheet: Bool = false
    @State private var newNoteTitle: String = ""
    @State private var newNoteContent: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("background4").edgesIgnoringSafeArea(.all)
            List {
                ForEach(notes) { note in
                    NavigationLink(note.title ?? "" , destination: NoteView(note: note))

                //    ForEach(manager.docs) { doc in
                //    NavigationLink(destination: DrawingWrapper(manager: manager, id: doc.id)
                    
                    
                    
                }
                .onDelete { indexSet in
                    guard let index = indexSet.first else { return }
                    viewContext.delete(notes[index])
                    try? viewContext.save()
                }
                
            }
            }
        .navigationTitle("Book Notes")
        .toolbar {
            ToolbarItem {
                Button {
                    showAddNoteSheet.toggle()
                } label: {
                    Label("Add Note", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddNoteSheet) {
            NavigationView {
                Form {
                    Section {
                    TextField("Book Notes", text: $newNoteTitle)
                    TextEditor(text: $newNoteContent)
                        .frame(height: 325)
                    }
                    
                    Section {
                        Button("Save") {
                            
                            let note = Note(entity: Note.entity(), insertInto: viewContext)
                            note.id = UUID()
                            note.title = newNoteTitle
                            note.content = newNoteContent
                            
                            try? viewContext.save()
                            newNoteTitle = ""
                            newNoteContent = ""
                            showAddNoteSheet.toggle()
                        }
                        
                        Button("Cancel") {
                            showAddNoteSheet.toggle()
                        }
                        .tint(.red)
                    }.frame(width: 150, height: 25, alignment: .center)
                }
                .navigationTitle("Add Note")
            }
        }
    }
}
}

struct BookNotesView_Previews: PreviewProvider {
    static var previews: some View {
        BookNotesView()
    }
}

