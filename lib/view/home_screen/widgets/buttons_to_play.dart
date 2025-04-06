import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/enum/run_button_enum.dart';
import 'package:provider/provider.dart';
import '../../../view_model/homescreen_view_model/game_view_model.dart';

class ButtonsToPlay extends StatelessWidget {
  const ButtonsToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(2, (colIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (rowIndex) {
              return _ButtonBuilder(
                index: colIndex * 3 + rowIndex,
              );
            }),
          );
        }),
      ),
    );
  }
}

class _ButtonBuilder extends StatefulWidget {
  const _ButtonBuilder({required this.index});

  final int index;

  @override
  State<_ButtonBuilder> createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<_ButtonBuilder>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTap() async {
    final gameProv = context.read<GameNotifier>();
    if (gameProv.blockInput) return;

    gameProv.playerOneMove(RunButtonEnum.values[widget.index]);
    setState(() => _scale = 0.85);

    await Future.delayed(const Duration(milliseconds: 100));

    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: Image.asset(
          RunButtonEnum.values[widget.index].assetPath,
          width: 75,
          height: 75,
        ),
      ),
    );
  }
}
