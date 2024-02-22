//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Y K on 22.02.2024.
//

import SwiftUI

struct CreditsView: View {
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMG
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            // HEADER
            HeaderView(title: "Credits")
            // CONTENT
                Text("Yuriy Kuhta")
                .foregroundStyle(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
            .font(.footnote)
            .foregroundStyle(.secondary)
            .fontWeight(.light)
        }
    }
}

#Preview {
    CreditsView()
}
