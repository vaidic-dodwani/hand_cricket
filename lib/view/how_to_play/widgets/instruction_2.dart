import 'package:flutter/material.dart';
import 'package:hand_cricket/view/how_to_play/widgets/instruction_index.dart';
import 'package:hand_cricket/view/shared/hand_gesture_enum.dart';
import 'package:hand_cricket/view/shared/hand_gesture_viewer.dart';
import '../../../utils/constants/app_constants.dart';

class Instruction2 extends StatelessWidget {
  const Instruction2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InstructionIndex(
            index: 2,
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppString.sameNumber,
                  textAlign: TextAlign.center, style: context.bodyLarge),
              Text(AppString.youAreOut,
                  textAlign: TextAlign.center,
                  style: context.bodyLarge.copyWith(
                    color: context.highlightRed,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: HandGestureViewer(
                        gesture: HandGestures.three,
                        angle: 30,
                        scaleX: -1,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: HandGestureViewer(
                        gesture: HandGestures.three,
                        angle: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          SizedBox(width: 30),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppString.differentNumber,
                  textAlign: TextAlign.center, style: context.bodyLarge),
              Text(AppString.youScoreRuns,
                  textAlign: TextAlign.center,
                  style: context.bodyLarge.copyWith(
                    color: context.successColor,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: HandGestureViewer(
                        gesture: HandGestures.three,
                        angle: 30,
                        scaleX: -1,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: HandGestureViewer(
                        gesture: HandGestures.five,
                        angle: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
