// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthFirebaseRoute.name: (routeData) {
      final args = routeData.argsAs<AuthFirebaseRouteArgs>(
          orElse: () => const AuthFirebaseRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AuthFirebasePage(
          key: args.key,
          userActive: args.userActive,
        ),
      );
    },
    CategoryPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<CategoryPasswordRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CategoryPasswordPage(
          key: args.key,
          userID: args.userID,
        ),
      );
    },
    ListServiseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ListServisePage(),
      );
    },
    RecoveryPasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RecoveryPasswordPage(),
      );
    },
    RegisterFirebaseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegisterFirebasePage(),
      );
    },
  };
}

/// generated route for
/// [AuthFirebasePage]
class AuthFirebaseRoute extends PageRouteInfo<AuthFirebaseRouteArgs> {
  AuthFirebaseRoute({
    Key? key,
    bool? userActive,
    List<PageRouteInfo>? children,
  }) : super(
          AuthFirebaseRoute.name,
          args: AuthFirebaseRouteArgs(
            key: key,
            userActive: userActive,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthFirebaseRoute';

  static const PageInfo<AuthFirebaseRouteArgs> page =
      PageInfo<AuthFirebaseRouteArgs>(name);
}

class AuthFirebaseRouteArgs {
  const AuthFirebaseRouteArgs({
    this.key,
    this.userActive,
  });

  final Key? key;

  final bool? userActive;

  @override
  String toString() {
    return 'AuthFirebaseRouteArgs{key: $key, userActive: $userActive}';
  }
}

/// generated route for
/// [CategoryPasswordPage]
class CategoryPasswordRoute extends PageRouteInfo<CategoryPasswordRouteArgs> {
  CategoryPasswordRoute({
    Key? key,
    required String userID,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryPasswordRoute.name,
          args: CategoryPasswordRouteArgs(
            key: key,
            userID: userID,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryPasswordRoute';

  static const PageInfo<CategoryPasswordRouteArgs> page =
      PageInfo<CategoryPasswordRouteArgs>(name);
}

class CategoryPasswordRouteArgs {
  const CategoryPasswordRouteArgs({
    this.key,
    required this.userID,
  });

  final Key? key;

  final String userID;

  @override
  String toString() {
    return 'CategoryPasswordRouteArgs{key: $key, userID: $userID}';
  }
}

/// generated route for
/// [ListServisePage]
class ListServiseRoute extends PageRouteInfo<void> {
  const ListServiseRoute({List<PageRouteInfo>? children})
      : super(
          ListServiseRoute.name,
          initialChildren: children,
        );

  static const String name = 'ListServiseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RecoveryPasswordPage]
class RecoveryPasswordRoute extends PageRouteInfo<void> {
  const RecoveryPasswordRoute({List<PageRouteInfo>? children})
      : super(
          RecoveryPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecoveryPasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegisterFirebasePage]
class RegisterFirebaseRoute extends PageRouteInfo<void> {
  const RegisterFirebaseRoute({List<PageRouteInfo>? children})
      : super(
          RegisterFirebaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterFirebaseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
