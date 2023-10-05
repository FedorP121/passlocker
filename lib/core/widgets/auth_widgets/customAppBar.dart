// ignore_for_file: file_names

import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar({
  required String text,
  required bool centerTitle,
  required VoidCallback onPressedBack,
}) {
  return AppBar(
    centerTitle: centerTitle,
    title: Text(text),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressedBack,
    ),
  );
}

/*
{
        // Ваш код для выполнения при нажатии на кнопку назад
        // Например, вернуться на предыдущую страницу:
        // Navigator.of(context).pop();
        // или выполнить другое действие
      },
*/
