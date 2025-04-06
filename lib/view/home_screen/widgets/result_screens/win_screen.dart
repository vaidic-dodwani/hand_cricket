import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/view/shared/custom_button.dart';
import 'package:hand_cricket/view_model/homescreen_view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image(image: const AssetImage(AppAssets.win)),
          const SizedBox(height: 20),
          SizedBox(height: 50),
          CustomButton(
            buttonText: AppString.playAgain,
            onPressed: () {
              context.read<GameNotifier>().restartGame();
            },
          ),
        ],
      ),
    );
  }
}
