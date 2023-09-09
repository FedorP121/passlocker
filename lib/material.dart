import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auto_route/route.dart';
import 'src/feature/auth_page/presentation/bloc/auth_person_bloc.dart';

class PassLocker extends StatefulWidget {
  const PassLocker({super.key});

  @override
  State<PassLocker> createState() => _PassLockerState();
}

class _PassLockerState extends State<PassLocker> {
  // This widget is the root of your application.

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => AuthPersonBloc(),
        ),
      ],
      child: MaterialApp.router(
        title: 'PASSLOCKER',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
