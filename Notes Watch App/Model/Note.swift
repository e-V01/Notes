//
//  Note.swift
//  Notes Watch App
//
//  Created by Y K on 20.02.2024.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
