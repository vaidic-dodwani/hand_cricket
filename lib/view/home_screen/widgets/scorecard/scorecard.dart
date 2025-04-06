import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/view/home_screen/widgets/scorecard/widgets/ball_counter.dart';
import 'package:hand_cricket/view/home_screen/widgets/scorecard/widgets/run_counter.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class Scorecard extends StatelessWidget {
  const Scorecard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, gameProv, child) => Column(
        children: [
          Container(
            height: 70,
            color: Colors.grey.withOpacity(0.5),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                      Expanded(
                          child: gameProv.playerInning == PlayerInning.batting
                              ? RunCounter()
                              : BallCounter())
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: gameProv.playerInning == PlayerInning.batting
                              ? BallCounter()
                              : RunCounter()),
                      Container(
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            gameProv.targetScore == null
                ? "${AppString.runs}: ${gameProv.numberOfRuns}"
                : "${AppString.toWin}: ${gameProv.targetScore! - gameProv.numberOfRuns}",
            style: context.labelLarge.copyWith(
                fontWeight: FontWeight.bold, color: context.highlightYellow),
          )
        ],
      ),
    );
  }
}
