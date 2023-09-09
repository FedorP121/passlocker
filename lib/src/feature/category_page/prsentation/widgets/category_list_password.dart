import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/auto_route/route.dart';

class ListCategoryPassword extends StatelessWidget {
  const ListCategoryPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Войти'),
      onPressed: () => AutoRouter.of(context).push(const ListServiseRoute()),
    );
  }
}
