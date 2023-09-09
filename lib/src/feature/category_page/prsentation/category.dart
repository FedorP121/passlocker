import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text('Войти'),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
