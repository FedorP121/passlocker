import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:untitled9/src/feature/category_page/prsentation/widgets/category_list_password.dart';

import 'widgets/add_category.dart';

@RoutePage()
class CategoryPasswordPage extends StatelessWidget {
  const CategoryPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории паролей'),
      ),
      body: SafeArea(
          child: ListView.separated(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) =>
            const ListCategoryPassword(),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => addCategory(context), child: const Icon(Icons.add)),
    );
  }
}
