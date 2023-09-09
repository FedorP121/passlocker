import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/auto_route/route.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            child: const Text('Войти'),
            onPressed: () => AutoRouter.of(context).push(const CategoryRoute()),
          ),
        ),
      ),
    );
  }
}
