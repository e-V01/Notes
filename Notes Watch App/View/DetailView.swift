//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Y K on 22.02.2024.
//

import SwiftUI

struct DetailView: View {
    let note: Note
    let count: Int
    let index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
           // HEADER
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
 
                Capsule()
                    .frame(height: 1)
            }
            .foregroundStyle(.accent)
          // CONTENT
            Spacer()
            ScrollView(.vertical) {
                Text(note.text)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            }
            Spacer()
        // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                
                    Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }
            .foregroundStyle(.secondary)
        }
        .padding(3)
    }
}

#Preview {
    DetailView(note: Note(id: UUID(), text: "Hello Yurii!"), count: 1, index: 1)
}
