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
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        DispatchQueue.main.async {
            //        dump(notes)
            do {
                // 1. Convert the notes array to data using JSONEncoder
                let data = try JSONEncoder().encode(notes)
                // 2. Create a new URL to save the file using the getDocumentDirectory
                let url = getDocumentDirectory().appendingPathComponent("notes")
                // 3. Write the data to the given URL
                try data.write(to: url)
                
            } catch {
                print("saving data has failed!")
            }
        }
    }
    
    func load() {
        do {
            // 1. Get the notes URL path
            let url = getDocumentDirectory().appendingPathComponent("notes")
            // 2. Create a new prop for the data
            let data = try Data(contentsOf: url)
            // 3. Decode the data
            notes = try JSONDecoder().decode([Note].self, from: data)
        } catch {
            // Do nothing
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }

    var body: some View {
        NavigationStack { // to be abel to see the navigationLink changes had to wrap it into NavStack (navView was deprecated)
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
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundStyle(.accent)
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            }
            .navigationTitle("Notes")
            .onAppear {
                load()
        }
        }
    }
}

#Preview {
    ContentView()
}
