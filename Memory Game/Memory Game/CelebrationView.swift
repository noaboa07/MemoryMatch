//
//  CelebrationView.swift
//  Memory Game
//
//  Created by Noah Russell on 10/28/24.
//

import SwiftUI

struct CelebrationView: View {
    @State private var randomCatImage: UIImage?
    
    var body: some View {
        ZStack {
            // Background with a gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Text("Congratulations!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundColor(.white)

                // Display the random cat image if available
                if let catImage = randomCatImage {
                    Image(uiImage: catImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250) // Increased size
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding()
                } else {
                    ProgressView() // Loading indicator while fetching the image
                        .onAppear {
                            fetchRandomCatImage() // Fetch the cat image when the view appears
                        }
                }

                Text("You've completed the game!")
                    .font(.title2)
                    .foregroundColor(.yellow)
                    .padding(.bottom)
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(20)
            .shadow(radius: 20)
            .padding()
        }
    }

    private func fetchRandomCatImage() {
        let urlString = "https://api.thecatapi.com/v1/images/search"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data,
               let catResponse = try? JSONDecoder().decode([CatImage].self, from: data),
               let imageUrl = catResponse.first?.url,
               let imageData = try? Data(contentsOf: URL(string: imageUrl)!) {
                DispatchQueue.main.async {
                    randomCatImage = UIImage(data: imageData)
                }
            }
        }.resume()
    }
}

// Model for decoding JSON response
struct CatImage: Codable {
    let url: String
}
