// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/core/auto_route/route.dart';

import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';

class ListCategoryPassword extends StatelessWidget {
  final PasswordModel passwordModel;
  const ListCategoryPassword({
    Key? key,
    required this.passwordModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String name = passwordModel.namePassword;
    final String password = passwordModel.password;
    final String discripcion = passwordModel.discripcion;
    return Container(
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.add_moderator_rounded),
          title: Text(name + password),
          subtitle: Text(discripcion),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () => AutoRouter.of(context).push(const ListServiseRoute()),
        ),
      ),
    );
  }
}
