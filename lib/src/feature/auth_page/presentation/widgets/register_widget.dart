import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/widgets/auth_widgets/elevatet_buttom.dart';
import 'package:untitled9/core/widgets/auth_widgets/textfield.dart';

import '../bloc/auth_person_bloc.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordTwoController = TextEditingController();
  final TextEditingController keyEmailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    passwordTwoController.dispose();
    keyEmailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();

    return Column(
      children: [
        customTextField(
          controller: emailController,
          labelText: 'Почта',
        ),
        const SizedBox(height: 20),
        customTextField(
          controller: passwordController,
          labelText: 'Пароль',
        ),
        const SizedBox(height: 20),
        customTextField(
          controller: passwordTwoController,
          labelText: 'Повторите пароль',
        ),
        const SizedBox(height: 20),
        BlocBuilder<AuthPersonBloc, AuthPersonState>(
          builder: (context, state) {
            if (state is RegisterFirebaseState) {
              return Column(
                children: [
                  Text(state.register),
                  const Text(
                    textAlign: TextAlign.center,
                    'На вашу почту пришло письмо, пройдите по ссылке из письма что бы подтвердить почту',
                  ),
                  TextButton(
                    onPressed: () =>
                        blocAuthFirebase.add(VerificationMailEvent()),
                    child: const Text('Проверить верификацию'),
                  ),
                ],
              );
            }

            if (state is ErrorRegisterState) {
              return Column(
                children: [
                  customElevatedButton(
                    widget: const Text('Регистрация'),
                    onPressed: () => blocAuthFirebase.add(
                      RegisterNewAcountEvent(
                        mail: emailController.text,
                        passwordOne: passwordController.text,
                        passwordTwo: passwordTwoController.text,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(state.error.toString()),
                ],
              );
            }

            if (state is LoadingRegisterState) {
              return customElevatedButton(
                widget: const CircularProgressIndicator(),
                onPressed: () {},
              );
            }

            if (state is StartRegisterState) {
              return customElevatedButton(
                widget: const Text('Регистрация'),
                onPressed: () => blocAuthFirebase.add(
                  RegisterNewAcountEvent(
                    mail: emailController.text,
                    passwordOne: passwordController.text,
                    passwordTwo: passwordTwoController.text,
                  ),
                ),
              );
            }

            if (state is VericationMailFirebaseState) {
              if (state.verification == 'Почта не подтверждена') {
                return Column(
                  children: [
                    Text(state.verification),
                    TextButton(
                      onPressed: () =>
                          blocAuthFirebase.add(VerificationMailEvent()),
                      child: const Text('Проверить еще раз'),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    Text(state.verification),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        blocAuthFirebase.add(StartAuthPageEvent());
                        AutoRouter.of(context).pop();
                      },
                      child: const Text('Войти в аккаунт'),
                    ),
                  ],
                );
              }
            }

            if (state is SendVerificationMailState) {
              return Column(
                children: [
                  Text(state.message),
                  TextButton(
                    onPressed: () =>
                        blocAuthFirebase.add(VerificationMailEvent()),
                    child: const Text('Проверить еще раз'),
                  ),
                ],
              );
            }

            return customElevatedButton(
              widget: const Text('Регистрация'),
              onPressed: () => blocAuthFirebase.add(
                RegisterNewAcountEvent(
                  mail: emailController.text,
                  passwordOne: passwordController.text,
                  passwordTwo: passwordTwoController.text,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
