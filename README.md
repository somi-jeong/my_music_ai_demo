# My Music AI – Hackathon Companion App

A small Flutter companion app built for a 2025 AI hackathon by a five-person team. The app is the mobile front door to the team's AI music service: it launches the web upload flow, plays back saved tracks, and credits the team.

> Built in a weekend (June 2025). The AI music generation itself runs in the team's web service; this repo contains the Flutter client only.

## Features

- **Home** – illustrated landing screen with three custom image buttons.
  - **New** – opens the hackathon web app's upload page in the external browser (`url_launcher`).
  - **Saved** – a list of bundled sample tracks with play / pause, replay-on-complete, and live state via `StreamBuilder` over `just_audio`'s player state stream.
  - **Credit** – team credits.
- **Custom pressed-state button** – `CustomImageButton` swaps artwork on tap-down / tap-up / cancel.
- Native splash screen (Android) via `flutter_native_splash`, Google Fonts (Atma, Delius), gradient theming.

## Tech stack

- Flutter (Dart SDK ^3.7.2)
- `just_audio`, `url_launcher`, `google_fonts`, `flutter_native_splash`

## Project structure

```text
lib/
├── main.dart                 # MaterialApp entry
├── home_page.dart            # landing screen + navigation
├── saved_page.dart           # saved tracks + AudioTile player widget
├── credit_page.dart          # team credits
└── custom_image_button.dart  # image button with pressed state
assets/                       # artwork and sample audio
```

## Run

```bash
flutter pub get
flutter run
```

## My role

Flutter client implementation (UI, navigation, audio playback).
