import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class MoveTimer extends StatelessWidget {
  const MoveTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, gameProv, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                    child: Text(
                  gameProv.timeLeft.toString(),
                  style: context.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white),
                )),
                CircularProgressIndicator(
                  value: gameProv.timeLeft / 10,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppString.pickANumberBeforeTimerRunsOut,
            style: context.bodyMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
