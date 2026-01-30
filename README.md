# XO Game 🎮

A simple XO game built with (Flutter), supporting two players with custom names.

---

## 📱 Features

- 🎮 Two-player local game (Player X vs Player O)
- ✍️ Custom player names via Login Screen
- 🔄 Restart round without resetting scores
- ♻️ Reset game and return to login screen
- 🧮 Score tracking for both players
- 📐 Responsive 3×3 grid layout
- 🧼 Clean and readable code structure

---

## 🖼 Screens

- Login Screen: enter player names
- Game Board Screen:
  - Player scores
  - Current turn indicator
  - 3×3 game grid
  - Restart / Reset buttons

---

## 🛠 Tech Stack

- **Flutter**
- **Dart**
- Material UI
- Navigator (Named Routes)

---

## 📂 Project Structure

```text
lib/
├── main.dart
├── models/
│   └── game_board_args.dart
├── screens/
│   ├── login_screen.dart
│   └── game_board_screen.dart
├── widgets/
│   ├── board_button.dart
│   └── play_score.dart
