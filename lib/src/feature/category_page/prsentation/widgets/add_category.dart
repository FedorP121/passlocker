// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled9/core/widgets/auth_widgets/textfield.dart';
import 'package:untitled9/src/feature/category_page/domain/entities/password_model.dart';
import 'package:untitled9/src/feature/category_page/prsentation/bloc/category_pass_bloc.dart';

@override
void addCategory(BuildContext context, String userID) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Добавить пароль'),
        content: ColumnTextField(
          userID: userID,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop(); // Закрыть диалоговое окно
            },
          ),
        ],
      );
    },
  );
}

class ColumnTextField extends StatefulWidget {
  final String userID;
  const ColumnTextField({
    Key? key,
    required this.userID,
  }) : super(key: key);

  @override
  State<ColumnTextField> createState() => _ColumnTextFieldState();
}

class _ColumnTextFieldState extends State<ColumnTextField> {
  TextEditingController namePassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController discripcion = TextEditingController();

  @override
  void dispose() {
    namePassword.dispose();
    password.dispose();
    discripcion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passLockerBloc = context.read<PassLockerBloc>();
    return Column(
      children: [
        customTextField(controller: namePassword, labelText: 'Имя пароля'),
        const SizedBox(height: 14),
        customTextField(controller: password, labelText: 'Пароль'),
        const SizedBox(height: 14),
        customTextField(controller: discripcion, labelText: 'Описание'),
        const SizedBox(height: 14),
        ElevatedButton(
          child: const Text('Сохранить'),
          onPressed: () {
            final PasswordModel passwordModel = PasswordModel(
              userID: widget.userID,
              namePassword: namePassword.text,
              password: password.text,
              discripcion: discripcion.text,
            );
            passLockerBloc
                .add(WriteNewPasswordEvent(passwordModel: passwordModel));
            Navigator.of(context).pop(); // Закрыть диалоговое окно
          },
        ),
      ],
    );
  }
}
