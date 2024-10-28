//
//  ConfettiView.swift
//  Memory Game
//
//  Created by Noah Russell on 10/28/24.
//

import SwiftUI

struct ConfettiView: View {
    @State private var particles: [Particle] = []
    @State private var timer: Timer?

    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple]

    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: false), value: particle.position)
                    .onAppear {
                        moveParticle(particle)
                    }
            }
        }
        .onAppear {
            startConfetti()
        }
        .onDisappear {
            stopConfetti()
        }
    }

    private func startConfetti() {
        particles = (0..<100).map { _ in
            Particle(
                color: colors.randomElement()!,
                size: CGFloat.random(in: 5...15),
                position: CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: -10)
            )
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            let index = Int.random(in: 0..<particles.count)
            let randomX = CGFloat.random(in: 0...UIScreen.main.bounds.width)
            particles[index].position = CGPoint(x: randomX, y: UIScreen.main.bounds.height + 10)
        }
    }

    private func stopConfetti() {
        timer?.invalidate()
    }

    private func moveParticle(_ particle: Particle) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if let index = particles.firstIndex(where: { $0.id == particle.id }) {
                particles[index].position.y = UIScreen.main.bounds.height + 10
            }
        }
    }
}

struct Particle: Identifiable {
    let id = UUID()
    var color: Color
    var size: CGFloat
    var position: CGPoint
}
