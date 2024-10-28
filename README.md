# Project 4 - *Memory Match*

Submitted by: **Noah Russell** ZNumber: **Z23667779**

**Memory Match** is an engaging memory card game that challenges players to find matching pairs of cards while racing against the clock. With vibrant themes featuring distinct emojis, animals, and colors, players can enjoy a visually appealing experience. The app includes a timer to track how quickly players complete the game and provides a celebratory screen with random cat images and confetti effects upon victory. Players can easily reset the game and choose different themes, adding variety and excitement to each session. Perfect for all ages, Memory Match is a fun way to sharpen memory skills while enjoying delightful graphics and animations! 

Time spent: **5** hours spent in total

## Required Features

The following **required** functionality is completed:

- [️✅] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards should be visible.
  - Cards are facedown to indicate the start of the game.
- [️✅] Users can tap cards to toggle their display between the back and the face: 
  - Tapping on a facedown card should flip it to reveal the front.
  - Tapping a second card that is not identical should flip both back down
- [️✅] When two matching cards are found, they both disappear from view:
  - Implement logic to check if two tapped cards match.
  - If they match, both cards should either disappear.
  - If they don't match, they should return to the facedown position.
- [️✅] User can reset the game and start a new game via a button:
  - Include a button that allows users to reset the game.
  - This button should shuffle the cards and reset any game-related state.
 
The following **optional** features are implemented:

- [✅] User can select number of pairs to play with (at least 2 unique values like 2 and 4).
  * (Hint: user Picker)
- [✅] App allows for user to scroll to see pairs out of view.
  * (Hint: Use a Scrollview)
- [✅] Add any flavor you’d like to your UI with colored buttons or backgrounds, unique cards, etc. 
  * Enhance the visual appeal of the app with colored buttons, backgrounds, or unique card designs.
  * Consider using animations or transitions to make the user experience more engaging.

The following **additional** features are implemented:

- [✅] Game timer tracks how long it takes for the player to finish the game.
- [✅] Score tracking keeps track of the number of matches made and displays the score.
- [✅] Celebration screen shows a congratulatory message, including random cat images and confetti effects when the game is won.
- [✅] Themed card sets allow players to choose different themes (animals, emojis, colors) to change the game’s aesthetics.

## Video Walkthrough

My video Walkthrough:

<img style="max-width:300px;" src="Memory Game/Memory Game/Assets.xcassets/Project4.gif">

GIF created with VEED.io



## Notes

Building this app came with its fair share of challenges:

- Animation Timing: Getting the card flip animations to feel right was a bit tricky. I had to play around with the timing and transitions to make sure everything looked smooth and responsive. It was a pain trying to make sure it flipped the way I wanted (both flipping up and face-down)

- State Management: Keeping track of which cards were selected, matched, or flipped took some careful planning. I wanted to avoid any glitches that could mess up the user experience.

- Dynamic Content: Adding the random cat images for the celebration screen was fun but required figuring out how to load them asynchronously. It took a bit of tweaking to make sure they showed up correctly.

- User Interface Consistency: I aimed for a visually appealing UI that worked well across different themes and devices. Finding that balance between looks and usability was a bit of a challenge.

- Confetti Animation: Implementing the confetti effect for the celebration was a fun challenge. I had to dive into particle systems and make sure it blended well with the rest of the celebration.


## License

    Copyright [2024] [Noah Russell]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
