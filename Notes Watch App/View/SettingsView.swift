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
    // store sliders value
    
    func update() {
        lineCount = Int(value)
    }
    
    var body: some View {
        VStack(spacing: 8) {
            // header
            HeaderView(title: "Settings")
            // actual line count
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            // slider
            // custom Bindinng (get-set, in)
            Slider(value: Binding(get: {
                self.value
            }, set: { (newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
        }
    }
}

#Preview {
    SettingsView()
}
