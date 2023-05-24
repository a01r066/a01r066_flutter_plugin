import 'package:flutter/material.dart';

/*
  Extensions Everywhere ... Or not?
  Dart extensions give superpowers to your classes. But with great power comes great responsibility.

  Writing shorter code isn't always the best way to make a project grow, especially when you're part of a team. When working on a Flutter project, Flutter and Dart APIs are the common base every developer should know.

  If you rely too much on extensions, you can lose familiarity with the general Flutter and Dart APIs.
  You might have difficulties when joining new projects where extensions aren't used. It might take you longer to get familiar with the project.

  Other developers are not familiar with your extensions.
  If other developers join your project, they might have difficulty understanding your code and following your practices. They'll have to learn your extensions in addition to everything else they'll need to learn, like the business and the architecture.

  In general, use extensions but don't rely too much on them.
 */

extension BuildContextX on BuildContext {
  /*
    // Without extension
    Theme.of(context).textTheme
    // With extension
    context.textTheme
   */
  TextTheme get textTheme => Theme.of(this).textTheme;

  /*
    // Without extension
    Theme.of(context).textTheme.headlineSmall
    // With extension
    context.headlineSmall
   */
  TextStyle? get headlineSmall => textTheme.headlineSmall;

  /*
    // Without extension
    Theme.of(this).primaryColor
    // With extension
    context.primaryColor
   */
  Color? get primaryColor => Theme.of(this).primaryColor;
}
