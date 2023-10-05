import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/widgets/auth_widgets/elevatet_buttom.dart';
import 'package:untitled9/core/widgets/auth_widgets/textfield.dart';

import '../bloc/auth_person_bloc.dart';

class RecoveryPasswordWidget extends StatefulWidget {
  const RecoveryPasswordWidget({super.key});

  @override
  State<RecoveryPasswordWidget> createState() => _RecoveryPasswordWidgetState();
}

class _RecoveryPasswordWidgetState extends State<RecoveryPasswordWidget> {
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();

    return Column(
      children: [
        const SizedBox(height: 20),
        customTextField(
          controller: emailController,
          labelText: 'Введите почту',
        ),
        const SizedBox(height: 20),
        BlocBuilder<AuthPersonBloc, AuthPersonState>(
          builder: (context, state) {
            if (state is ErrorPaswordState) {
              return Text(state.error.toString());
            }
            if (state is SendPasswordResetEmailState) {
              return Column(
                children: [
                  Text(state.message),
                  const Text('Откройте письмо и измените свой пароль'),
                  const SizedBox(height: 20),
                  customElevatedButton(
                    widget: const Text('Войти в аккаунт'),
                    onPressed: () => AutoRouter.of(context).pop(),
                  ),
                ],
              );
            }

            if (state is ErrorPaswordState) {
              return Column(
                children: [
                  customElevatedButton(
                    widget: const Text('Отправить письмо на почту'),
                    onPressed: () =>
                        blocAuthFirebase.add(SendPasswordResetEmailEvent(
                      email: emailController.text,
                    )),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    state.error.toString(),
                  ),
                ],
              );
            }

            if (state is StartRecoveryPasswordState) {
              return customElevatedButton(
                widget: const Text('Отправить письмо на почту'),
                onPressed: () => blocAuthFirebase.add(
                  SendPasswordResetEmailEvent(
                    email: emailController.text,
                  ),
                ),
              );
            }

            return customElevatedButton(
              widget: const Text('Отправить письмо на почту'),
              onPressed: () => blocAuthFirebase.add(SendPasswordResetEmailEvent(
                email: emailController.text,
              )),
            );
          },
        ),
      ],
    );
  }
}
