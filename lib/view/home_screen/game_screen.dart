import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/utils/enum/game_overlay_enum.dart';
import 'package:hand_cricket/view/home_screen/widgets/buttons_to_play.dart';
import 'package:hand_cricket/view/home_screen/widgets/other_overlay_screen.dart';
import 'package:hand_cricket/view/home_screen/widgets/move_timer.dart';
import 'package:hand_cricket/view/home_screen/widgets/playbox.dart';
import 'package:hand_cricket/view/home_screen/widgets/result_screens/win_screen.dart';
import 'package:hand_cricket/view/home_screen/widgets/scorecard/scorecard.dart';
import 'package:provider/provider.dart';

import '../../view_model/homescreen_view_model/game_view_model.dart';
import 'widgets/background_image.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final gameProv = context.read<GameNotifier>();
      gameProv.startGame();
    });
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          // paints the background image with a carved effect for the box with hands
          CarvedImageBackground(),

          // paints the above scorecard showcasing balls and runs
          Positioned.fill(
            child: Scorecard(),
          ),

          // paints the playbox with hands
          Positioned(
            height: size.height * 0.2,
            // this reduction is due to the border adjustment
            top: size.height * 0.2 - 8,
            left: size.width * 0.15,
            right: size.width * 0.15,
            child: Playbox(),
          ),

          // paints the timer for the ball left
          Positioned.fill(
            top: size.height * 0.5,
            bottom: size.height * 0.3,
            child: MoveTimer(),
          ),

          // paints the button to play the game
          Positioned(
            height: size.height * 0.3,
            bottom: 0,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: ButtonsToPlay(),
          ),

          Consumer<GameNotifier>(builder: (context, gameNotifier, child) {
            if (gameNotifier.overlay.assetPath != null) {
              return Stack(
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.85),
                  ),
                  Center(
                    child: Image.asset(
                      gameNotifier.overlay.assetPath!,
                    ),
                  ),
                  if (gameNotifier.overlay == GameOverlay.bowling)
                    Center(
                      child: Text(
                        gameNotifier.targetScore.toString(),
                        style: context.headlineLarge
                            .copyWith(color: Color(0xFFB9E6FB)),
                      ),
                    )
                ],
              );
            } else {
              return OtherOverLayScreen(
                overlay: gameNotifier.overlay,
              );
            }
          }),
        ],
      )),
    );
  }
}
