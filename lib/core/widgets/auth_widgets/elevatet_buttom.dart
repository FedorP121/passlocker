import 'package:flutter/material.dart';

class CusttomElevatedButton extends StatelessWidget {
  const CusttomElevatedButton({
    Key? key,
    required this.widget,
    required this.onPressed,
  }) : super(key: key);

  final Widget widget;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: widget,
    );
  }
}
