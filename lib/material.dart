import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/core/auto_route/route.dart';
import 'package:untitled9/core/service_locator/service_locvator.dart';
import 'package:untitled9/src/feature/auth_page/presentation/bloc/auth_person_bloc.dart';
import 'package:untitled9/src/feature/category_page/prsentation/bloc/category_pass_bloc.dart';

class PassLocker extends StatefulWidget {
  const PassLocker({super.key});

  @override
  State<PassLocker> createState() => _PassLockerState();
}

class _PassLockerState extends State<PassLocker> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => getIt<AuthPersonBloc>(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => getIt<PassLockerBloc>(),
        )
      ],
      child: MaterialApp.router(
        title: 'PASSLOCKER',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser:
            _appRouter.defaultRouteParser(includePrefixMatches: true),
      ),
    );
  }
}
