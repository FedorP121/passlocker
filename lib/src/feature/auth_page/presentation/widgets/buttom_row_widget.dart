import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/auto_route/route.dart';
import 'package:untitled9/core/widgets/auth_widgets/text_buttom.dart';

import '../bloc/auth_person_bloc.dart';

class ButtomRowWidget extends StatelessWidget {
  const ButtomRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: customTextButtom(
              text: 'Забыл пароль',
              onPressed: () {
                blocAuthFirebase.add(StartRecoveryPageEvent());
                AutoRouter.of(context).push(const RecoveryPasswordRoute());
              }),
        ),
        Expanded(
          flex: 1,
          child: customTextButtom(
              text: 'Регистрация',
              onPressed: () {
                blocAuthFirebase.add(StartRegisterPageEvent());
                AutoRouter.of(context).push(const RegisterFirebaseRoute());
              }),
        ),
      ],
    );
  }
}
