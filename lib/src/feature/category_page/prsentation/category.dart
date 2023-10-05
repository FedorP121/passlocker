// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled9/core/auto_route/route.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/prsentation/bloc/category_pass_bloc.dart';
import 'package:untitled9/src/feature/category_page/prsentation/widgets/category_list_password.dart';

import 'widgets/add_category.dart';

@RoutePage()
class CategoryPasswordPage extends StatelessWidget {
  final String userID;
  const CategoryPasswordPage({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории паролей'),
        actions: [
          IconButton(
            onPressed: () {
              AutoRouter.of(context)
                  .replace(AuthFirebaseRoute(userActive: false));
            },
            icon: const Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: BodyListViewWidget(
          userID: userID,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addCategory(context, userID),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BodyListViewWidget extends StatelessWidget {
  final String userID;
  const BodyListViewWidget({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ListenDataFirebaseEvent
    final passLockerBloc = context.read<PassLockerBloc>();
    passLockerBloc.add(ListenDataFirebaseEvent(userID: userID));
    return BlocConsumer<PassLockerBloc, CategoryPassState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ListenDataFirebaseState) {
            final List<PasswordModel> listPasswordModel = state.passwordModel;
            final count = listPasswordModel.length;
            return ListView.builder(
                itemCount: count,
                itemBuilder: (BuildContext context, int index) {
                  final PasswordModel passwordModel = listPasswordModel[index];
                  return ListCategoryPassword(passwordModel: passwordModel);
                });
          }
          return const Center(child: Text('Тут пока пусто'));
        });
  }
}

/*
  import 'package:aes256gcm/aes256gcm.dart';
  var text = 'SOME DATA TO ENCRYPT';
  var password = 'password';

  var encrypted = await Aes256Gcm.encrypt(text, password);
  var decrypted = await Aes256Gcm.decrypt(encrypted, password);

  print(encrypted);
  print(decrypted);
  */
