import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/enum/game_overlay_enum.dart';
import 'package:hand_cricket/view/home_screen/widgets/result_screens/lose_screen.dart';
import 'package:hand_cricket/view/home_screen/widgets/result_screens/tie_screen.dart';
import 'package:hand_cricket/view/home_screen/widgets/result_screens/timed_out_screen.dart';
import 'package:hand_cricket/view/home_screen/widgets/result_screens/win_screen.dart';

class OtherOverLayScreen extends StatelessWidget {
  final GameOverlay overlay;
  const OtherOverLayScreen({super.key, required this.overlay});

  @override
  Widget build(BuildContext context) {
    if (overlay == GameOverlay.none) return const SizedBox.shrink();
    return Stack(
      children: [
        Container(
          color: Colors.black.withOpacity(0.85),
        ),
        if (overlay == GameOverlay.lose) const LoseScreen(),
        if (overlay == GameOverlay.win) const WinScreen(),
        if (overlay == GameOverlay.tie) const TieScreen(),
        if (overlay == GameOverlay.timedOut) const TimedOutScreen()
      ],
    );
  }
}
