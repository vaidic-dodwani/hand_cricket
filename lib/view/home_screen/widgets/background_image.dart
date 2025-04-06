import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'dart:async';
import 'package:hand_cricket/utils/constants/app_constants.dart';

class CarvedImageBackground extends StatefulWidget {
  const CarvedImageBackground({super.key});

  @override
  State<CarvedImageBackground> createState() => _CarvedImageBackgroundState();
}

class _CarvedImageBackgroundState extends State<CarvedImageBackground> {
  ui.Image? _backgroundImage;

  @override
  void initState() {
    _loadImage();
    super.initState();
  }

  Future<void> _loadImage() async {
    final ByteData data = await rootBundle.load(AppAssets.backgroundImage);
    final Uint8List bytes = data.buffer.asUint8List();

    final ui.Image image = await decodeImageFromList(bytes);

    setState(() {
      _backgroundImage = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BackgroundPainter(image: _backgroundImage),
      size: MediaQuery.sizeOf(context),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final ui.Image? image;

  BackgroundPainter({required this.image});

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) return;

    // Draw the background image
    canvas.drawImageRect(
      image!,
      Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()),
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint(),
    );

    // Draw the semi-transparent white overlay
    Paint overlayPaint = Paint()..color = Colors.white.withOpacity(0.15);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), overlayPaint);

    // Define the rectangle area for hands
    final double boxWidth = size.width * 0.7;
    final double boxHeight = size.height * 0.2;
    final double boxLeft = (size.width - boxWidth) / 2;
    final double boxTop = size.height * 0.2;

    final RRect roundedRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(boxLeft, boxTop, boxWidth, boxHeight),
      const Radius.circular(8),
    );

    // Draw the border around the rounded rectangle
    Paint borderPaint = Paint()
      ..color = AppColors.primaryColor
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawRRect(roundedRect, borderPaint);

    canvas.clipRRect(roundedRect);

    // Carve out the area by drawing the original image over the overlay
    canvas.drawImageRect(
      image!,
      Rect.fromLTWH(
        boxLeft * (image!.width / size.width),
        boxTop * (image!.height / size.height),
        boxWidth * (image!.width / size.width),
        boxHeight * (image!.height / size.height),
      ),
      Rect.fromLTWH(boxLeft, boxTop, boxWidth, boxHeight),
      Paint(),
    );

    Paint blackOverlayPaint = Paint()..color = Colors.black.withOpacity(0.2);
    canvas.drawRect(
      Rect.fromLTWH(boxLeft, boxTop, boxWidth, boxHeight),
      blackOverlayPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
