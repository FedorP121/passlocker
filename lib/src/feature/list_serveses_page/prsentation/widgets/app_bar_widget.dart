import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget({Key? key})
      : super(
          key: key,
          title: const Text('Лист паролей'),
          actions: const [Icon(Icons.person_pin_outlined)],
        );
}
