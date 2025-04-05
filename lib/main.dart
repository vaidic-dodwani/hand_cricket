import 'package:flutter/material.dart';
import 'package:hand_cricket/view/how_to_play/how_to_play.dart';
import 'utils/constants/app_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.darkTheme, home: HowToPlay());
  }
}
