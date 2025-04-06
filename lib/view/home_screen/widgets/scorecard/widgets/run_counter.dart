import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class RunCounter extends StatelessWidget {
  const RunCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameNotifier>(
      builder: (context, gameProv, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(2, (colIndex) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                3,
                (rowIndex) {
                  int index = colIndex * 3 + rowIndex;
                  return _RunBuilder(
                    run: gameProv.runsThisOver.length > index
                        ? (gameProv.runsThisOver[index]).toString()
                        : null,
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _RunBuilder extends StatelessWidget {
  const _RunBuilder({this.run});

  final String? run;

  @override
  Widget build(BuildContext context) {
    if (run == null) {
      return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      );
    }
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: AppColors.successColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          run!,
        ),
      ),
    );
  }
}
