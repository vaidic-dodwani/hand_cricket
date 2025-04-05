import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';

class InstructionIndex extends StatelessWidget {
  /// The index of the instruction.
  final int index;
  const InstructionIndex({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color(0xFF7C252D),
              Color(0xFF351418),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
      padding: EdgeInsets.all(8),
      child: Center(
          child: Text(
        index.toString(),
        style: context.bodyMedium.copyWith(
          color: context.highlightYellow,
        ),
      )),
    );
  }
}
