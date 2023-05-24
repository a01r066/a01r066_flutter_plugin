import 'package:flutter/material.dart';

mixin KDialogsMixin {
  showKDialog(
    BuildContext context, {
    String? title,
    required String content,
    Color? color,
    double? radius,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 0)),
              contentPadding: EdgeInsets.zero,
              title: Text(title ?? "Notice"),
              content: Container(
                  decoration: BoxDecoration(color: color),
                  padding: const EdgeInsets.all(16),
                  child: Text(content)));
        });
  }
}
