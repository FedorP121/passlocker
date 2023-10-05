// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled9/core/auto_route/route.dart';
import 'package:untitled9/src/feature/auth_page/presentation/bloc/auth_person_bloc.dart';

import 'widgets/auth_widget.dart';
import 'widgets/buttom_row_widget.dart';

@RoutePage()
class AuthFirebasePage extends StatefulWidget {
  bool? userActive;
  AuthFirebasePage({
    Key? key,
    this.userActive,
  }) : super(key: key);

  @override
  State<AuthFirebasePage> createState() => _AuthFirebasePageState();
}

class _AuthFirebasePageState extends State<AuthFirebasePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final blocAuthFirebase = context.read<AuthPersonBloc>();
    if (widget.userActive == false) {
      blocAuthFirebase.add(LogOutEvent());
    } else {
      blocAuthFirebase.add(AuthCheckEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthPersonBloc, AuthPersonState>(
      listener: (context, state) {
        if (state is AuthCheckedState) {
          if (state.auth) {
            AutoRouter.of(context)
                .replace(CategoryPasswordRoute(userID: state.userID));
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PassLoker'),
          centerTitle: true,
        ),
        body: BlocBuilder<AuthPersonBloc, AuthPersonState>(
            builder: (context, state) {
          if (state is AuthCheckedState && !state.auth) {
            return const AuthFirebaseWidget();
          }

          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const AuthFirebaseWidget();
        }),
      ),
    );
  }
}

class AuthFirebaseWidget extends StatelessWidget {
  const AuthFirebaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(15),
        width: 500,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthWidget(),
            ButtomRowWidget(),
          ],
        ),
      ),
    );
  }
}
