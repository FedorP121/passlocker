import 'package:flutter/material.dart';

Widget customTextButtom({
  required String text,
  required VoidCallback onPressed,
}) {
  return TextButton(
    onPressed: onPressed,
    child: Text(text),
  );
}
