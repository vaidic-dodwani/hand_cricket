import 'package:flutter/material.dart';
import 'package:hand_cricket/utils/constants/app_constants.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineLarge => textTheme.headlineLarge!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineSmall => textTheme.headlineSmall!;

  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  Color get primaryColor => theme.primaryColor;
  Color get secondaryColor => theme.colorScheme.secondary;
  Color get highlightYellow => theme.colorScheme.tertiary;
  Color get highlightRed => theme.colorScheme.error;
  Color get successColor => AppColors.successColor;
}
