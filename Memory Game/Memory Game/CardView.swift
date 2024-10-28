//
//  CardView.swift
//  Memory Game
//
//  Created by Noah Russell on 10/28/24.
//

import SwiftUI
import UIKit

struct CardView: View {
    let card: Card
    var onTap: () -> Void // Closure to handle tap

    var body: some View {
        ZStack {
            // Custom background and shape
            RoundedRectangle(cornerRadius: 15)
                .fill(card.isFaceUp ? Color.white : Color.blue)
                .frame(width: 100, height: 150)
                .shadow(radius: 5)

            if card.isFaceUp {
                Text(card.content)
                    .font(.largeTitle)
                    .transition(.scale)
                    .animation(.easeInOut(duration: 0.3), value: card.isFaceUp)
            }
        }
        .rotation3DEffect(
            .degrees(card.isFaceUp ? 0 : 180),
            axis: (x: 0, y: 1, z: 0)
        )
        .opacity(card.isMatched ? 0 : 1)
        .animation(.easeInOut(duration: 0.3), value: card.isMatched)
        .onTapGesture {
            if !card.isMatched {
                withAnimation {
                    onTap()
                }
            }
        }
    }
}
