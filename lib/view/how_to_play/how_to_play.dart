import 'package:flutter/material.dart';
import 'package:hand_cricket/view/home_screen/game_screen.dart';
import 'package:hand_cricket/view/how_to_play/widgets/instruction_1.dart';
import 'package:hand_cricket/view/shared/custom_button.dart';

import '../../utils/constants/app_constants.dart';
import 'widgets/instruction_2.dart';

class HowToPlay extends StatelessWidget {
  const HowToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'How to Play',
                textAlign: TextAlign.center,
                style: context.headlineMedium
                    .copyWith(color: context.highlightYellow),
              ),
              SizedBox(height: 50),
              Instruction1(),
              SizedBox(height: 20),
              Instruction2(),
              Spacer(),
              CustomButton(
                buttonText: 'Start Playing',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GameScreen()));
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
