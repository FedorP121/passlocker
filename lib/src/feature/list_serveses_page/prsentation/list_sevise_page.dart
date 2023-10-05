import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/password_widget.dart';

@RoutePage()
class ListServisePage extends StatelessWidget {
  const ListServisePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Лист паролей'),
        actions: [
          IconButton(
            onPressed: () async {
              // await FirebaseService().logOut();
              // AutoRouter.of(context).replace(const AuthRoute());
              // // .replace(const AuthRoute());
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body: SafeArea(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, // 1 элемента в ряду
            childAspectRatio: 3 / 1, // соотношение сторон элементов
            crossAxisSpacing: 10, // промежуток по горизонтали
            mainAxisSpacing: 10, // промежуток по вертикали
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) =>
              const CardPasswordWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
