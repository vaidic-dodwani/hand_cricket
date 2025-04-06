# Hand Cricket Game

A fun and interactive hand cricket game built using Flutter.

## 🛠️ Tech Stack
- **Flutter Version:** 3.24.5
- **State Management:** Provider
- **Animations:** Optional use of Rive for hand gestures

## 🏏 Game Overview
This app simulates a hand cricket match between a player and a bot based on traditional informal gameplay rules:
- User bats first.
- Both player and bot show hand gestures (1 to 6 fingers).
- If both show the same number, the batsman is out.
- Otherwise, the shown number is added as runs.
- The bot chases the player’s score in its innings.
- A 10-second timer limits the user’s input time. Timeout means losing the game.


## 📦 Getting Started

### Prerequisites
- Flutter 3.24.5 installed

### Steps to Run
```bash
# Clone the repo
git clone https://github.com/vaidic-dodwani/hand_cricket
cd hand_cricket

# Install dependencies
flutter pub get

# Run the app
flutter run
