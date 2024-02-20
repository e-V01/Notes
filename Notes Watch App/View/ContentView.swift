//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Y K on 20.02.2024.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROP
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    // MARK: - FUNC
    func save() {
        dump(notes)
    }

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                    
                Button {
                    // 1. Only the buttons's action when the text field is not empty
                    guard text.isEmpty == false else { return }
                    // 2. Create a new note item and initialize it with the text value
                    let note = Note(id: UUID(), text: text)
                    // 3. Add the new note item to the notes array (append)
                    notes.append(note)
                    // 4. Make the next field empty
                    text = ""
                    // 5. Save the notes (function)
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundStyle(.accent)
            }
            Spacer()
            
            Text("\(notes.count)")
        }
        .navigationTitle("Notes")
        .navigationBarTitleDisplayMode(.inline)
        .foregroundStyle(.accent)
    }
}

#Preview {
    ContentView()
}
