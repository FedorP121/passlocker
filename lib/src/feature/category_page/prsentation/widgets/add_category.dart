import 'package:flutter/material.dart';

@override
void addCategory(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Доавить категорию паролей'),
        content: const TextField(),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалоговое окно
            },
          ),
          ElevatedButton(
            child: const Text('Сохранить'),
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалоговое окно
            },
          ),
        ],
      );
    },
  );
}
