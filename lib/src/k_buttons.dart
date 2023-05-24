import 'package:flutter/material.dart';

class KTextButton extends StatelessWidget {
  const KTextButton({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
