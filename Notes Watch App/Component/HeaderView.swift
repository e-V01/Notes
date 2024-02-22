//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Y K on 22.02.2024.
//

import SwiftUI

struct HeaderView: View {
    var title: String = ""
    
    
    var body: some View {
        VStack {
            // title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.accent)
            }
            // separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")

                Capsule()
                    .frame(height: 1)
            }
            .foregroundStyle(.accent)
        }
        
    }
}

#Preview {
    Group {
        HeaderView(title: "Credits")

    }
}

#Preview {
    Group {
        HeaderView()

    }
}
