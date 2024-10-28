//
//  ContentView.swift
//  Memory Game
//
//  Created by Noah Russell on 10/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = []
    @State private var firstSelectedCardIndex: Int?
    @State private var secondSelectedCardIndex: Int?
    @State private var numberOfPairs: Int = 2
    @State private var elapsedTime: Int = 0
    @State private var matchesMade: Int = 0
    @State private var timer: Timer?
    @State private var showGameOverAlert = false
    @State private var showCelebration = false
    @State private var selectedThemeIndex: Int = 0

    // Define themes with distinct emojis
    let themes = [
        ("Animals", ["🐶", "🐱", "🐰", "🐻", "🦁", "🐼", "🐸", "🦊"]),
        ("Emojis", ["😀", "😍", "😜", "😎", "😇", "😱", "🤩", "🥳"]),
        ("Colors", ["🔴", "🟠", "🟡", "🟢", "🔵", "🟣", "⚫️", "⚪️"])
    ]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Elapsed Time: \(elapsedTime) seconds")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding()

                Text("Matches Made: \(matchesMade)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.black)
                    .padding()

                // Theme Picker
                Picker("Select Theme", selection: $selectedThemeIndex) {
                    ForEach(0..<themes.count, id: \.self) { index in
                        Text(themes[index].0).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedThemeIndex) { newValue, oldValue in
                    resetGame() // Call resetGame when the theme changes
                }

                Picker("Select Number of Pairs", selection: $numberOfPairs) {
                    ForEach(2...4, id: \.self) { value in
                        Text("\(value) Pairs").tag(value)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: numberOfPairs) { resetGame() }

                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                        ForEach(cards) { card in
                            CardView(card: card) {
                                cardTapped(card)
                            }
                        }
                    }
                    .padding()
                }
            }
            .onAppear { resetGame() }
            .onDisappear { timer?.invalidate() }
            .alert(isPresented: $showGameOverAlert) {
                Alert(title: Text("Game Over"),
                      message: Text("Congratulations! You finished the game in \(elapsedTime) seconds with \(matchesMade) matches."),
                      dismissButton: .default(Text("OK")))
            }

            // Celebration view
            if showCelebration {
                CelebrationView()
                    .transition(.scale)
                    .animation(.easeInOut, value: showCelebration)

                // Confetti view
                ConfettiView()
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .overlay(
            VStack {
                Spacer() // Push the reset button to the bottom
                Button(action: resetGame) {
                    Text("Reset Game")
                        .font(.headline)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
            }
        )
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
        }
    }

    private func cardTapped(_ card: Card) {
        guard !card.isFaceUp, secondSelectedCardIndex == nil else { return }

        if let index = cards.firstIndex(where: { $0.id == card.id }) {
            if firstSelectedCardIndex == nil {
                firstSelectedCardIndex = index
                cards[index].isFaceUp = true
                if elapsedTime == 0 {
                    startTimer()
                }
            } else {
                secondSelectedCardIndex = index
                cards[index].isFaceUp = true
                checkForMatch()
            }
        }
    }

    private func checkForMatch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let firstIndex = firstSelectedCardIndex, let secondIndex = secondSelectedCardIndex {
                if cards[firstIndex].content == cards[secondIndex].content {
                    withAnimation {
                        cards[firstIndex].isMatched = true
                        cards[secondIndex].isMatched = true
                        matchesMade += 1
                    }
                } else {
                    withAnimation {
                        cards[firstIndex].isFaceUp = false
                        cards[secondIndex].isFaceUp = false
                    }
                }
            }
            firstSelectedCardIndex = nil
            secondSelectedCardIndex = nil
            
            // Check for game over
            if cards.allSatisfy({ $0.isMatched }) {
                timer?.invalidate()
                showCelebration = true
                showGameOverAlert = true
            }
        }
    }

    private func resetGame() {
        elapsedTime = 0
        matchesMade = 0
        timer?.invalidate()
        
        // Randomly select emojis from the chosen theme
        let selectedEmojis = themes[selectedThemeIndex].1.shuffled().prefix(numberOfPairs)
        cards = Array(selectedEmojis).flatMap { content in
            [Card(content: content), Card(content: content)]
        }.shuffled()
        
        firstSelectedCardIndex = nil
        secondSelectedCardIndex = nil
        showCelebration = false
    }
}





