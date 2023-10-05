import 'package:flutter/material.dart';

class CardPasswordWidget extends StatelessWidget {
  const CardPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Тинькофф',
                  style: TextStyle(fontSize: 20),
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      maxLines: 5,
                      'Пароль от тинькоффПароль от тинькоффПароль от тинькоффПароль от тинькоффПароль от тинькоффПароль от тинькоффПароль от тинькофф'),
                )),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.topCenter,
                child: PopupMenuItemWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopupMenuItemWidget extends StatelessWidget {
  const PopupMenuItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case 'Пункт 1':
            break;
          case 'Пункт 2':
            break;
          case 'Пункт 3':
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'Пункт 1',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Копировать пароль'), Icon(Icons.copy)],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Пункт 2',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Редактировать пароль'),
              Icon(Icons.edit),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Пункт 3',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Удалить'),
              Icon(Icons.delete),
            ],
          ),
        ),
      ],
      icon: const Icon(Icons.more_vert), // Иконка с тремя вертикальными точками
    );
  }
}
