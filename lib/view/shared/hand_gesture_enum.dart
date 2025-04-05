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
}
