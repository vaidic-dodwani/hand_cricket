import 'package:hand_cricket/utils/constants/app_constants.dart';

enum GameOverlay {
  none,
  out,
  six,
  win,
  lose,
  tie,
  timedOut,
  batting,
  bowling,
}

extension GameOverlayExtension on GameOverlay {
  String? get assetPath {
    switch (this) {
      case GameOverlay.none:
      case GameOverlay.win:
      case GameOverlay.lose:
      case GameOverlay.tie:
      case GameOverlay.timedOut:
        return null;
      case GameOverlay.out:
        return AppAssets.out;
      case GameOverlay.six:
        return AppAssets.six;
      case GameOverlay.batting:
        return AppAssets.batting;
      case GameOverlay.bowling:
        return AppAssets.bowling;
    }
  }
}
