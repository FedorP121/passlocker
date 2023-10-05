import 'package:flutter/material.dart';

Widget customElevatedButton({
  required VoidCallback onPressed,
  required Widget widget,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    child: widget,
  );
}
