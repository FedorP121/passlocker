import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:untitled9/src/feature/auth_page/presentation/auth_fb_page.dart';
import 'package:untitled9/src/feature/auth_page/presentation/recovery_password_fb_page.dart';
import 'package:untitled9/src/feature/auth_page/presentation/register_fb_page.dart';
import 'package:untitled9/src/feature/category_page/prsentation/category.dart';
import 'package:untitled9/src/feature/list_serveses_page/prsentation/list_sevise_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: AuthFirebaseRoute.page, path: '/'), // страница авторизации
        AutoRoute(page: ListServiseRoute.page),
        AutoRoute(page: RecoveryPasswordRoute.page),
        AutoRoute(page: RegisterFirebaseRoute.page),
        AutoRoute(page: CategoryPasswordRoute.page),
      ];
}

// flutter packages pub run build_runner build   - команда для билда
// AutoRoute(page: AuthFirebaseRoute.page, path: '/'),
// AutoRoute(page: ListServiseRoute.page),
// при отправки аргументов из одной страницы в другу страницу мы должны
// по новой сгенерировать part 'router.gr.dart'; , а перед этим сделать
// конструктор с полем в странице где мы хотим получить аргументы
