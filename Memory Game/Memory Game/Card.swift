//
//  Card.swift
//  Memory Game
//
//  Created by Noah Russell on 10/28/24.
//

import Foundation

struct Card: Identifiable {
    let id: UUID
    let content: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false

    init(content: String) {
        self.id = UUID()
        self.content = content
    }
}
