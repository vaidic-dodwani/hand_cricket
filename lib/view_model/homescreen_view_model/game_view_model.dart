import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/enum/game_overlay_enum.dart';
import 'package:hand_cricket/view/shared/hand_gesture_enum.dart';
import 'package:hand_cricket/view/shared/run_button_enum.dart';

class GameNotifier extends ChangeNotifier {
  GameOverlay overlay = GameOverlay.none;

  bool blockInput = true;
  PlayerInning playerInning = PlayerInning.batting;

  HandGestures playerOneGesture = HandGestures.none;
  HandGestures playerTwoGesture = HandGestures.none;

  int numberOfBalls = 0;
  bool gameEnded = false;
  List<int> runsThisOver = [];

  int get numberOfRuns => runsThisOver.fold(0, (sum, run) => sum + run);
  int? targetScore;

  int timeLeft = 10;
  bool resetTimer = false;
  bool pauseTimer = false;

  void startGame() async {
    await setOverlay(GameOverlay.batting);
    startTimer();

    blockInput = false;
    notifyListeners();
  }

  Future<void> playerOneMove(RunButtonEnum runButton) async {
    if (blockInput) return;
    blockInput = true;
    pauseTimer = true;
    if (playerInning == PlayerInning.batting) {
      playerOneGesture = runButton.handGesture;
      playerTwoGesture = randomisePlayerTwoGesture().handGesture;
      notifyListeners();
      await handleEveryBallLogic();

      notifyListeners();
    } else {
      playerTwoGesture = randomisePlayerTwoGesture().handGesture;
      playerOneGesture = runButton.handGesture;
      notifyListeners();

      await handleEveryBallLogic();

      notifyListeners();
    }
    if (!gameEnded) {
      resetTimer = true;
      pauseTimer = false;
      startTimer();
      blockInput = false;
    } else {
      blockInput = true;
    }
  }

  Future<void> pauseForEachBallAndResetAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    resetHandAnimation();
  }

  Future<void> resetHandAnimation() async {
    playerOneGesture = HandGestures.none;
    playerTwoGesture = HandGestures.none;
    notifyListeners();
  }

  Future<void> handleEveryBallLogic() async {
    bool toPause = true;
    if (playerInning == PlayerInning.batting) {
      if (playerOneGesture == playerTwoGesture) {
        await endFirstInning(isOut: true);
        resetHandAnimation();
        return;
      } else if (playerOneGesture == HandGestures.six) {
        await setOverlay(GameOverlay.six);
        toPause = false;
      }
      runsThisOver.add(playerOneGesture.value);
      numberOfBalls++;
      if (numberOfBalls == 6) {
        endFirstInning();
      }
    } else {
      if (playerOneGesture == playerTwoGesture) {
        endGameWithResult();
        return;
      } else if (playerTwoGesture == HandGestures.six) {
        await setOverlay(GameOverlay.six);
        toPause = false;
      }
      runsThisOver.add(playerTwoGesture.value);
      numberOfBalls++;

      if (numberOfRuns >= targetScore! || numberOfBalls == 6) {
        endGameWithResult();
        return;
      }
    }
    if (toPause) {
      await pauseForEachBallAndResetAnimation();
    } else {
      resetHandAnimation();
    }
  }

  Future<void> endFirstInning({bool isOut = false}) async {
    if (isOut) await setOverlay(GameOverlay.out);
    playerInning = PlayerInning.bowling;
    targetScore = numberOfRuns + 1;
    runsThisOver = [];
    numberOfBalls = 0;
    await setOverlay(GameOverlay.bowling);

    notifyListeners();
  }

  void endGameWithResult() {
    gameEnded = true;
    pauseTimer = true;
    if (numberOfRuns >= targetScore!) {
      overlay = GameOverlay.lose;
    } else if (numberOfRuns == targetScore! - 1) {
      overlay = GameOverlay.tie;
    } else {
      overlay = GameOverlay.win;
    }
    notifyListeners();
  }

  RunButtonEnum randomisePlayerTwoGesture() {
    final Random random = Random();
    final randMove = random.nextInt(6);
    // return RunButtonEnum.five;
    return RunButtonEnum.values[randMove];
  }

  Future<void> setOverlay(GameOverlay overlay) async {
    this.overlay = overlay;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));
    this.overlay = GameOverlay.none;

    notifyListeners();
  }

  void onTimerEnd() {
    overlay = GameOverlay.timedOut;
    notifyListeners();
  }

  void startTimer() {
    if (resetTimer) {
      timeLeft = 11;
    }
    if (pauseTimer) {
      return;
    }
    if (timeLeft > 0) {
      timeLeft--;
      Future.delayed(const Duration(seconds: 1), startTimer);
    } else {
      onTimerEnd();
    }
    resetTimer = false;
    notifyListeners();
  }

  void restartGame() {
    blockInput = true;
    gameEnded = false;
    playerInning = PlayerInning.batting;
    playerOneGesture = HandGestures.none;
    playerTwoGesture = HandGestures.none;
    numberOfBalls = 0;
    runsThisOver = [];
    targetScore = null;
    timeLeft = 10;
    resetTimer = false;
    pauseTimer = false;
    overlay = GameOverlay.none;

    notifyListeners();
    startGame();
  }
}

enum PlayerInning {
  batting,
  bowling,
}
