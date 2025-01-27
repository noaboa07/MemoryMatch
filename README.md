# Memory Match - Engaging Memory Card Game

**Memory Match** is an engaging memory card game that challenges players to find matching pairs of cards while racing against the clock. With vibrant themes featuring distinct emojis, animals, and colors, players can enjoy a visually appealing experience. The app includes a timer to track how quickly players complete the game and provides a celebratory screen with random cat images and confetti effects upon victory. Players can easily reset the game and choose different themes, adding variety and excitement to each session. Perfect for all ages, Memory Match is a fun way to sharpen memory skills while enjoying delightful graphics and animations!

- Developer: Noah Russell  
- Development Time: 5 hours  
- Technologies Used: Swift, SwiftUI, Xcode

## Features

The following required features have been successfully implemented:

- [✅] **Card Grid**: The app loads with a grid of cards that are initially placed face-down, indicating the start of the game.
- [✅] **Card Flip**: Users can tap cards to flip them, revealing the front. If two cards do not match, they are flipped back down.
- [✅] **Match Detection**: When two matching cards are found, they disappear from the screen.
- [✅] **Game Reset**: Users can reset the game and start a new one via a button that reshuffles the cards.

The following optional features have been successfully implemented:

- [✅] **Card Pair Selection**: Users can choose the number of pairs to play with (at least 2 unique values, such as 2 and 4).
- [✅] **Scrolling**: The game allows users to scroll to view card pairs that are out of view.
- [✅] **Visual Enhancements**: The UI features colored buttons, custom backgrounds, and unique card designs.

The following additional features have been implemented:

- [✅] **Game Timer**: Tracks how long it takes for the player to finish the game.
- [✅] **Score Tracking**: Displays the number of matches made during the game.
- [✅] **Celebration Screen**: Shows a congratulatory message with random cat images and confetti effects when the game is won.
- [✅] **Themed Cards**: Users can select different themes (animals, emojis, colors) to change the aesthetics of the game.

## Future Enhancements

Potential future features include:

- [🔲] **Leaderboard**: Track high scores and allow players to compete with friends.
- [🔲] **Sound Effects and Music**: Add sound effects for card flips, matches, and background music to enhance the game experience.

## Setup Instructions

To run the Memory Match game locally, follow these steps:

1. Clone the Repository:
    - `git clone https://github.com/your-username/Memory-Match.git`
    - `cd Memory-Match`
2. Open in Xcode:
    - Open the `.xcodeproj` or `.xcworkspace` file in Xcode.
3. Install Dependencies:
    - If using CocoaPods or Swift Package Manager, install the required libraries (if any):
    - `pod install`
4. Build and Run:
    - Select the desired simulator or physical iOS device.
    - Click the “Run” button to build and launch the app.
5. Test:
    - Play the game by tapping on cards to find matches.
    - Track your score and timer during gameplay.
    - Reset the game and try different themes and difficulty levels.

## Video Walkthrough

Here’s a quick demonstration of the app’s core features:

<img style="max-width:300px;" src="Memory Game/Memory Game/Assets.xcassets/Project4.gif">

GIF created with VEED.io

## Development Process

This app was built using SwiftUI for a responsive UI and to make the card flip animations smooth and engaging. I used `Timer` and `State` to track game progress, handle game resets, and implement the timer and score functions. The celebration screen utilizes a randomization of cat images and particle systems for the confetti effect.

## Challenges Faced

- **Animation Timing**: Ensuring smooth card flip animations with appropriate timing and transitions.
- **State Management**: Tracking the state of cards, whether flipped, matched, or face-down, was critical to avoid glitches and ensure seamless gameplay.
- **Dynamic Content**: Loading and displaying random cat images asynchronously for the celebration screen posed some challenges.
- **UI Consistency**: Maintaining a visually appealing UI across themes and devices while ensuring usability was tricky.
- **Confetti Animation**: Implementing a confetti effect for the celebration screen required using particle systems to blend seamlessly with the game.

## Key Takeaways

- Gained experience in creating dynamic and interactive UI elements with SwiftUI.
- Learned how to implement smooth animations and transitions to enhance user experience.
- Enjoyed working on visual design elements, including random image loading and confetti effects.

## Technologies Used

- Programming Language: Swift
- Frameworks: SwiftUI, UIKit
- Development Environment: Xcode 14.0+
- Version Control: Git, GitHub

## License

Memory Match is licensed under the Apache License 2.0.  
You may obtain a copy of the license at:  
http://www.apache.org/licenses/LICENSE-2.0
