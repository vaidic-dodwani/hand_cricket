import 'package:flutter/material.dart';
import 'package:hand_cricket/view/shared/hand_gesture_viewer.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class Playbox extends StatelessWidget {
  const Playbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, gameProv, child) => Row(
        children: [
          Expanded(
              child: HandGestureViewer(
            gesture: gameProv.playerOneGesture,
            scaleX: -1,
          )),
          SizedBox(width: 10),
          Expanded(
              child: HandGestureViewer(
            gesture: gameProv.playerTwoGesture,
          )),
        ],
      ),
    );
  }
}
