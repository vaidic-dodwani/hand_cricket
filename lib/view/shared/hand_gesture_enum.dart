enum HandGestures {
  none,
  one,
  two,
  three,
  four,
  five,
  six,
}

extension HandGestureExtension on HandGestures {
  String get name {
    switch (this) {
      case HandGestures.none:
        return 'Idle';
      case HandGestures.one:
        return 'One';
      case HandGestures.two:
        return 'Two';
      case HandGestures.three:
        return 'Three';
      case HandGestures.four:
        return 'Four';
      case HandGestures.five:
        return 'Five';
      case HandGestures.six:
        return 'Six';
    }
  }

  int get value {
    switch (this) {
      case HandGestures.none:
        return 0;
      case HandGestures.one:
        return 1;
      case HandGestures.two:
        return 2;
      case HandGestures.three:
        return 3;
      case HandGestures.four:
        return 4;
      case HandGestures.five:
        return 5;
      case HandGestures.six:
        return 6;
    }
  }
}
