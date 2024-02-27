//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by Y K on 27.02.2024.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage ("lineCount") var lineCount: Int = 1
    // permanently stores lineValue in App  (userDefaults)
    @State private var value: Float = 1.0
    var body: some View {
        VStack(spacing: 8) {
            // header
            HeaderView(title: "Settings")
            // actual line count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            // slider
        }
    }
}

#Preview {
    SettingsView()
}
