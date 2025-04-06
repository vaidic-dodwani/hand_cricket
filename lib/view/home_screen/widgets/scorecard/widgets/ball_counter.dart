import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_assets.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class BallCounter extends StatelessWidget {
  const BallCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, gameProv, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            2,
            (colIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  3,
                  (rowIndex) {
                    int ballNumber = 3 * colIndex + rowIndex;
                    bool isActive = ballNumber < gameProv.runsThisOver.length;
                    return _BallBuilder(
                      isActive: isActive,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BallBuilder extends StatelessWidget {
  const _BallBuilder({this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.ball,
      opacity: isActive
          ? const AlwaysStoppedAnimation(1)
          : const AlwaysStoppedAnimation(0.3),
      width: 20,
      height: 20,
    );
  }
}
