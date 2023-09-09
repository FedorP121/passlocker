import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ListServisePage extends StatelessWidget {
  const ListServisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лист паролей'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Конец'),
        ),
      ),
    );
  }
}
