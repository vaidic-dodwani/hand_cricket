import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hand_cricket/view/shared/hand_gesture_enum.dart';
import 'package:rive/rive.dart' as rive;

import '../../utils/constants/app_constants.dart';

class HandGestureViewer extends StatefulWidget {
  final HandGestures gesture;
  final int angle;
  final double scaleX;

  const HandGestureViewer({
    super.key,
    required this.gesture,
    this.angle = 0,
    this.scaleX = 1,
  });

  @override
  State<HandGestureViewer> createState() => _HandGestureViewerState();
}

class _HandGestureViewerState extends State<HandGestureViewer> {
  rive.Artboard? _artboard;
  rive.SimpleAnimation? _controller;

  @override
  void didUpdateWidget(covariant HandGestureViewer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.gesture != widget.gesture && _artboard != null) {
      _artboard!.removeController(_controller!);
      _controller = rive.SimpleAnimation(widget.gesture.name);
      _artboard!.addController(_controller!);
      setState(() {});
    }
  }

  void _onRiveInit(rive.Artboard artboard) {
    _artboard = artboard;
    _controller = rive.SimpleAnimation(widget.gesture.name);
    artboard.addController(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scaleX: widget.scaleX,
      child: Transform.rotate(
        angle: widget.angle * (pi / 180),
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
