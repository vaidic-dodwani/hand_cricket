import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hand_cricket/view/shared/hand_gesture_enum.dart';
import 'package:rive/rive.dart' as rive;

import '../../utils/constants/app_constants.dart';

class HandGestureViewer extends StatelessWidget {
  final HandGestures gesture;
  final int angle;
  final double scaleX;

  const HandGestureViewer({
    super.key,
    required this.gesture,
    this.angle = 0,
    this.scaleX = 1,
  });

  void _onRiveInit(rive.Artboard artboard) {
    final controller = rive.SimpleAnimation(gesture.name);
    artboard.addController(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: scaleX,
      child: Transform.rotate(
        angle: angle * (pi / 180),
        child: rive.RiveAnimation.asset(
          AppAssets.handGestureRive,
          fit: BoxFit.contain,
          artboard: "Artboard",
          onInit: _onRiveInit,
        ),
      ),
    );
  }
}
