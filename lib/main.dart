import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/provider/app_providers.dart';
import 'package:hand_cricket/view/home_screen/game_screen.dart';
import 'package:hand_cricket/view/how_to_play/how_to_play.dart';
import 'package:provider/provider.dart';
import 'utils/constants/app_constants.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppProvider.providers,
        child: MaterialApp(theme: AppTheme.darkTheme, home: HowToPlay()));
  }
}
