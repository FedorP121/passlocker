import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/widgets/auth_widgets/customAppBar.dart';

import 'bloc/auth_person_bloc.dart';
import 'widgets/recovery_password_widget.dart';

@RoutePage()
class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Scaffold(
      appBar: customAppBar(
        text: 'Изменить пароль',
        centerTitle: true,
        onPressedBack: () {
          blocAuthFirebase.add(StartAuthPageEvent());
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: 500,
            child: const RecoveryPasswordWidget(),
          ),
        ),
      ),
    );
  }
}
