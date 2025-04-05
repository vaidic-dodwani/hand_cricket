import 'package:flutter/material.dart';
import 'package:hand_cricket/view/how_to_play/widgets/instruction_index.dart';
import '../../../utils/constants/app_constants.dart';

class Instruction1 extends StatelessWidget {
  const Instruction1({super.key});

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
            index: 1,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              AppString.tapTheButtonsToScoreRuns,
              textAlign: TextAlign.center,
              style: context.bodyLarge.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 40),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: AppAssets.buttons.length,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Image.asset(
                    AppAssets.buttons[index],
                    height: 50,
                    fit: BoxFit.cover,
                    isAntiAlias: true,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
