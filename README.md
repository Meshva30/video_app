# Instagram Reels App

Welcome to the Shorts Scrolling App! This Flutter application allows users to scroll through short video reels, similar to Instagram Reels. The app features a play/pause button in the bottom navigation bar, as well as on-screen mute/unmute options for each reel.

## Features

- **Scrollable Reels**: Users can scroll through an endless feed of short video reels.
- **Play/Pause Functionality**: Easily control video playback using the play/pause button in the bottom navigation bar.
- **Mute/Unmute Option**: Quickly mute or unmute the audio for individual reels directly on the screen.

## Screenshots


<h2>📸Photos</h2>
 
 
   <p align='center'>
  <img src='https://github.com/Meshva30/video_app/assets/136339359/dc75eb6b-0c09-41f4-9a9d-f249a4725c35' width=240>
  <img src='https://github.com/Meshva30/video_app/assets/136339359/2491d631-feb8-437e-8fbf-398067acaae0' width=240>
  <img src='https://github.com/Meshva30/video_app/assets/136339359/8ee369a1-a1a4-41c5-a886-24ff6249f24f' width=240>
  <img src='https://github.com/Meshva30/video_app/assets/136339359/ad20531f-be7d-40cd-a171-6fa25542d150' width=240>
  
</p>






  </p>
  
  <h2>📽️Video</h2>
  <p>
    <table align="center">
  <tr>
    <video src ="https://github.com/Meshva30/video_app/assets/136339359/1f5d85c3-9458-43d9-9e1b-2bd07e3788a0"></video> </h1>
  </tr>
    </table>   
  </p>





## Built With

This app is built using the following Flutter packages:

- **provider**: A wrapper around InheritedWidget to make state management easy.
- **video_player**: A Flutter plugin for displaying inline video with other Flutter widgets.
- **chewie**: A video player for Flutter that provides a uniform interface for video playback, making it easy to customize the player controls.
- **card_swiper**: A card swiper widget for Flutter that makes it easy to create swipeable cards, used here to navigate between reels.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Aayush014/instagram_shorts_app.git
    ```

2. Install the dependencies:
    ```bash
    flutter pub get
    ```

## Usage

1. Ensure you have a device or emulator running.
2. Start the application:
    ```bash
    flutter run
    ```
3. The app will launch, and you can begin scrolling through video reels.

## Packages in Detail

### provider

`provider` is used for state management in the app. It helps manage the state of the video reels and user interactions in a clean and efficient manner.

### video_player

`video_player` is a powerful Flutter plugin that provides functionality to play videos. It supports various video formats and integrates seamlessly with Flutter's widget system.

### chewie

`chewie` wraps around `video_player` to provide a customizable video player interface. It offers easy-to-use controls and a consistent look and feel across different platforms.

### card_swiper

`card_swiper` is used to create a swipeable card interface, allowing users to easily scroll through the video reels. This package offers smooth animations and customizable card styles.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-name
    ```
3. Make your changes and commit them:
    ```bash
    git commit -m "Add some feature"
    ```
4. Push to the branch:
    ```bash
    git push origin feature-name
    ```


