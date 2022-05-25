// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    RootRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HealPointPage());
    },
    EmptyRouterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    DoctorsRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HealthCaresRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    PharmacyRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ProfileRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ProfilePage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    NotificationsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotificationsPage());
    },
    DoctorDetailsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorDetailsPage());
    },
    ChatRoomRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ChatRoomPage());
    },
    DoctorsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorsPage());
    },
    HealthCaresRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HealthCaresPage());
    },
    CenterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CenterDetailsRouteArgs>(
          orElse: () => const CenterDetailsRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.CenterDetailsPage(key: args.key));
    },
    NearMeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NearMePage());
    },
    PharmacyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PharmacyPage());
    },
    CatalogueRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CataloguePage());
    },
    DrugDetailRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DrugDetailPage());
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SignInPage(key: args.key));
    },
    SignUpRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    SignUpRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SignUpPage());
    },
    PasswordRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PasswordPage());
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PhoneVerificationPage());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(RootRouter.name, path: '/', children: [
          _i2.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i2.RouteConfig(NotificationsRoute.name,
                    path: 'notifications', parent: HomeRouter.name),
                _i2.RouteConfig(DoctorDetailsRoute.name,
                    path: 'doctor_detail', parent: HomeRouter.name),
                _i2.RouteConfig(ChatRoomRoute.name,
                    path: 'chat_room', parent: HomeRouter.name)
              ]),
          _i2.RouteConfig(DoctorsRouter.name,
              path: 'doctors',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(DoctorsRoute.name,
                    path: '', parent: DoctorsRouter.name)
              ]),
          _i2.RouteConfig(HealthCaresRouter.name,
              path: 'health_cares',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(HealthCaresRoute.name,
                    path: '', parent: HealthCaresRouter.name),
                _i2.RouteConfig(CenterDetailsRoute.name,
                    path: 'center_details', parent: HealthCaresRouter.name),
                _i2.RouteConfig(NearMeRoute.name,
                    path: 'near_me', parent: HealthCaresRouter.name)
              ]),
          _i2.RouteConfig(PharmacyRouter.name,
              path: 'pharmacy',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(PharmacyRoute.name,
                    path: '', parent: PharmacyRouter.name),
                _i2.RouteConfig(CatalogueRoute.name,
                    path: 'catalogue', parent: PharmacyRouter.name),
                _i2.RouteConfig(DrugDetailRoute.name,
                    path: 'drug_details', parent: PharmacyRouter.name)
              ]),
          _i2.RouteConfig(ProfileRouter.name,
              path: 'account', parent: RootRouter.name)
        ]),
        _i2.RouteConfig(EmptyRouterRoute.name,
            path: '/authentication',
            children: [
              _i2.RouteConfig(SignInRoute.name,
                  path: '', parent: EmptyRouterRoute.name),
              _i2.RouteConfig(SignUpRouter.name,
                  path: 'sign_up',
                  parent: EmptyRouterRoute.name,
                  children: [
                    _i2.RouteConfig(SignUpRoute.name,
                        path: '', parent: SignUpRouter.name),
                    _i2.RouteConfig(PasswordRoute.name,
                        path: 'password', parent: SignUpRouter.name),
                    _i2.RouteConfig(PhoneVerificationRoute.name,
                        path: 'phone_verification', parent: SignUpRouter.name)
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.HealPointPage]
class RootRouter extends _i2.PageRouteInfo<void> {
  const RootRouter({List<_i2.PageRouteInfo>? children})
      : super(RootRouter.name, path: '/', initialChildren: children);

  static const String name = 'RootRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class EmptyRouterRoute extends _i2.PageRouteInfo<void> {
  const EmptyRouterRoute({List<_i2.PageRouteInfo>? children})
      : super(EmptyRouterRoute.name,
            path: '/authentication', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HomeRouter extends _i2.PageRouteInfo<void> {
  const HomeRouter({List<_i2.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class DoctorsRouter extends _i2.PageRouteInfo<void> {
  const DoctorsRouter({List<_i2.PageRouteInfo>? children})
      : super(DoctorsRouter.name, path: 'doctors', initialChildren: children);

  static const String name = 'DoctorsRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class HealthCaresRouter extends _i2.PageRouteInfo<void> {
  const HealthCaresRouter({List<_i2.PageRouteInfo>? children})
      : super(HealthCaresRouter.name,
            path: 'health_cares', initialChildren: children);

  static const String name = 'HealthCaresRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PharmacyRouter extends _i2.PageRouteInfo<void> {
  const PharmacyRouter({List<_i2.PageRouteInfo>? children})
      : super(PharmacyRouter.name, path: 'pharmacy', initialChildren: children);

  static const String name = 'PharmacyRouter';
}

/// generated route for
/// [_i1.ProfilePage]
class ProfileRouter extends _i2.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'account');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.NotificationsPage]
class NotificationsRoute extends _i2.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(NotificationsRoute.name, path: 'notifications');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i1.DoctorDetailsPage]
class DoctorDetailsRoute extends _i2.PageRouteInfo<void> {
  const DoctorDetailsRoute()
      : super(DoctorDetailsRoute.name, path: 'doctor_detail');

  static const String name = 'DoctorDetailsRoute';
}

/// generated route for
/// [_i1.ChatRoomPage]
class ChatRoomRoute extends _i2.PageRouteInfo<void> {
  const ChatRoomRoute() : super(ChatRoomRoute.name, path: 'chat_room');

  static const String name = 'ChatRoomRoute';
}

/// generated route for
/// [_i1.DoctorsPage]
class DoctorsRoute extends _i2.PageRouteInfo<void> {
  const DoctorsRoute() : super(DoctorsRoute.name, path: '');

  static const String name = 'DoctorsRoute';
}

/// generated route for
/// [_i1.HealthCaresPage]
class HealthCaresRoute extends _i2.PageRouteInfo<void> {
  const HealthCaresRoute() : super(HealthCaresRoute.name, path: '');

  static const String name = 'HealthCaresRoute';
}

/// generated route for
/// [_i1.CenterDetailsPage]
class CenterDetailsRoute extends _i2.PageRouteInfo<CenterDetailsRouteArgs> {
  CenterDetailsRoute({_i3.Key? key})
      : super(CenterDetailsRoute.name,
            path: 'center_details', args: CenterDetailsRouteArgs(key: key));

  static const String name = 'CenterDetailsRoute';
}

class CenterDetailsRouteArgs {
  const CenterDetailsRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'CenterDetailsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.NearMePage]
class NearMeRoute extends _i2.PageRouteInfo<void> {
  const NearMeRoute() : super(NearMeRoute.name, path: 'near_me');

  static const String name = 'NearMeRoute';
}

/// generated route for
/// [_i1.PharmacyPage]
class PharmacyRoute extends _i2.PageRouteInfo<void> {
  const PharmacyRoute() : super(PharmacyRoute.name, path: '');

  static const String name = 'PharmacyRoute';
}

/// generated route for
/// [_i1.CataloguePage]
class CatalogueRoute extends _i2.PageRouteInfo<void> {
  const CatalogueRoute() : super(CatalogueRoute.name, path: 'catalogue');

  static const String name = 'CatalogueRoute';
}

/// generated route for
/// [_i1.DrugDetailPage]
class DrugDetailRoute extends _i2.PageRouteInfo<void> {
  const DrugDetailRoute() : super(DrugDetailRoute.name, path: 'drug_details');

  static const String name = 'DrugDetailRoute';
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i2.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i3.Key? key})
      : super(SignInRoute.name, path: '', args: SignInRouteArgs(key: key));

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i3.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SignUpRouter extends _i2.PageRouteInfo<void> {
  const SignUpRouter({List<_i2.PageRouteInfo>? children})
      : super(SignUpRouter.name, path: 'sign_up', initialChildren: children);

  static const String name = 'SignUpRouter';
}

/// generated route for
/// [_i1.SignUpPage]
class SignUpRoute extends _i2.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i1.PasswordPage]
class PasswordRoute extends _i2.PageRouteInfo<void> {
  const PasswordRoute() : super(PasswordRoute.name, path: 'password');

  static const String name = 'PasswordRoute';
}

/// generated route for
/// [_i1.PhoneVerificationPage]
class PhoneVerificationRoute extends _i2.PageRouteInfo<void> {
  const PhoneVerificationRoute()
      : super(PhoneVerificationRoute.name, path: 'phone_verification');

  static const String name = 'PhoneVerificationRoute';
}
