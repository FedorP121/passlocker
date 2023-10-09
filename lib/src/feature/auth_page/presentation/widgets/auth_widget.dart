import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/widgets/widgets.dart';

import '../bloc/auth_person_bloc.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CustomTextField(
              controller: emailController,
              labelText: 'Почта',
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: passwordController,
              labelText: 'Пароль',
            ),
          ],
        ),
        const SizedBox(height: 15),
        BlocBuilder<AuthPersonBloc, AuthPersonState>(
          builder: (context, state) {
            if (state is StartAuthState) {
              return StartStateWidget(
                passwordController: passwordController,
                emailController: emailController,
              );
            }

            // cостояние ошибки
            if (state is ErrorFirebaseState) {
              return ErrorFirebaseStateWidget(
                error: state.error.toString(),
                passwordController: passwordController,
                emailController: emailController,
              );
            }
            // состояние успешной/не успешной авторизации
            if (state is LoginFirebaseState) {
              if (state.inLogin == 'Ваша почта не подтверждена') {
                return NoVerificationState(
                  message: state.inLogin,
                );
              }

              if (state.inLogin == 'Авторизация успешна') {
                // от автоматически перейдет на другую страницу,
                // т.к. я слежу за состоянием авторизации всего приложения
                // AutoRouter.of(context).replace(const CategoryPasswordRoute());
              } else {
                return ErrorLoginFirebaseStateWidget(
                  passwordController: passwordController,
                  emailController: emailController,
                  error: state.inLogin,
                );
              }
            }

            if (state is VericationMailFirebaseState) {
              return VericationMailFirebaseWidget(
                message: state.verification,
              );
            }

            // состояние загрузки
            if (state is LoadingState) {
              return const LoadingStateWidget();
            }

            if (state is SendVerificationMailState) {
              return const SendVerificationMailWidget();
            }

            if (state is LoadingSendVerificationMailState) {
              return const LoadingSendVerificationMailWidget();
            }

            // стартовое состоние
            return StartStateWidget(
              passwordController: passwordController,
              emailController: emailController,
            );
          },
        ),
      ],
    );
  }
}

class LoadingSendVerificationMailWidget extends StatelessWidget {
  const LoadingSendVerificationMailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Отправка письма'),
        SizedBox(height: 20),
        CircularProgressIndicator()
      ],
    );
  }
}

class VericationMailFirebaseWidget extends StatelessWidget {
  final String message;
  const VericationMailFirebaseWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Column(
      children: [
        Text(message),
        const SizedBox(height: 20),
        CusttomElevatedButton(
          widget: const Text('Войти'),
          onPressed: () =>
              // AutoRouter.of(context).replace(const CategoryPasswordRoute()),
              blocAuthFirebase.add(AuthCheckEvent()),
        ),
      ],
    );
  }
}

class NoVerificationState extends StatelessWidget {
  final String message;
  const NoVerificationState({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Column(
      children: [
        Text(message),
        TextButton(
          onPressed: () => blocAuthFirebase.add(SendVerificationMailEvent()),
          child: const Text('Отправить письмо на почту'),
        )
      ],
    );
  }
}

class SendVerificationMailWidget extends StatelessWidget {
  const SendVerificationMailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Column(
      children: [
        const Text(
          textAlign: TextAlign.center,
          'На вашу почту пришло письмо, пройдите по ссылке из письма что бы подтвердить почту',
        ),
        TextButton(
          onPressed: () => blocAuthFirebase.add(VerificationMailEvent()),
          child: const Text('Проверить верификацию'),
        ),
      ],
    );
  }
}
// состояние загрузки

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CusttomElevatedButton(
      widget: const CircularProgressIndicator(),
      onPressed: () {},
    );
  }
}

// стартовое состоние

class StartStateWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const StartStateWidget({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return CusttomElevatedButton(
        widget: const Text('Войти'),
        onPressed: () {
          blocAuthFirebase.add(LoginInAcountEvent(
            mail: emailController.text,
            password: passwordController.text,
          ));
          blocAuthFirebase.add(AuthCheckEvent());
        });
  }
}

// cостояние ошибки

class ErrorFirebaseStateWidget extends StatelessWidget {
  final String error;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ErrorFirebaseStateWidget({
    Key? key,
    required this.error,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Column(
      children: [
        CusttomElevatedButton(
          widget: const Text('Войти'),
          onPressed: () => blocAuthFirebase.add(LoginInAcountEvent(
            mail: emailController.text,
            password: passwordController.text,
          )),
        ),
        const SizedBox(height: 20),
        Text(error),
      ],
    );
  }
}

// состояние успешной/не успешной авторизации

class ErrorLoginFirebaseStateWidget extends StatelessWidget {
  final String error;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const ErrorLoginFirebaseStateWidget({
    Key? key,
    required this.error,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CusttomElevatedButton(
          widget: const Text('Войти'),
          onPressed: () => blocAuthFirebase.add(LoginInAcountEvent(
            mail: emailController.text,
            password: passwordController.text,
          )),
        ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          error,
        ),
      ],
    );
  }
}
