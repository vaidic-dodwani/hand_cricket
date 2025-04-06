import 'package:hand_cricket/utils/constants/app_constants.dart';
import 'package:hand_cricket/view/shared/hand_gesture_enum.dart';

enum RunButtonEnum {
  one,
  two,
  three,
  four,
  five,
  six,
}

extension RunButtonEnumExtension on RunButtonEnum {
  // int get value {
  //   switch (this) {
  //     case RunButtonEnum.one:
  //       return 1;
  //     case RunButtonEnum.two:
  //       return 2;
  //     case RunButtonEnum.three:
  //       return 3;
  //     case RunButtonEnum.four:
  //       return 4;
  //     case RunButtonEnum.five:
  //       return 5;
  //     case RunButtonEnum.six:
  //       return 6;
  //   }
  // }

  String get assetPath {
    switch (this) {
      case RunButtonEnum.one:
        return AppAssets.buttons[0];
      case RunButtonEnum.two:
        return AppAssets.buttons[1];
      case RunButtonEnum.three:
        return AppAssets.buttons[2];
      case RunButtonEnum.four:
        return AppAssets.buttons[3];
      case RunButtonEnum.five:
        return AppAssets.buttons[4];
      case RunButtonEnum.six:
        return AppAssets.buttons[5];
    }
  }

  HandGestures get handGesture {
    switch (this) {
      case RunButtonEnum.one:
        return HandGestures.one;
      case RunButtonEnum.two:
        return HandGestures.two;
      case RunButtonEnum.three:
        return HandGestures.three;
      case RunButtonEnum.four:
        return HandGestures.four;
      case RunButtonEnum.five:
        return HandGestures.five;
      case RunButtonEnum.six:
        return HandGestures.six;
    }
  }
}
