// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/screens.dart' as _i2;
import '../utilities/root.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RootRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.RootPage());
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignInPage(key: args.key));
    },
    HealPointRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HealPointPage());
    },
    SignUpRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    NearMeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.NearMePage());
    },
    PharmacyRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    OrdersRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    RatingsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    SignUpRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignUpPage());
    },
    PasswordRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PasswordPage());
    },
    PhoneVerificationRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PhoneVerificationPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    CenterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CenterDetailsRouteArgs>(
          orElse: () => const CenterDetailsRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.CenterDetailsPage(key: args.key));
    },
    ProfileRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ProfilePage());
    },
    PharmacyRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.PharmacyPage());
    },
    CatalogueRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CataloguePage());
    },
    DrugDetailRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.DrugDetailPage());
    },
    OrdersRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OrdersPage());
    },
    RatingsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RatingsPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RootRouter.name, path: '/', children: [
          _i3.RouteConfig(SignInRoute.name,
              path: 'sign_in', parent: RootRouter.name),
          _i3.RouteConfig(HealPointRoute.name,
              path: 'heal_point', parent: RootRouter.name),
          _i3.RouteConfig(SignUpRouter.name,
              path: 'sign_up',
              parent: RootRouter.name,
              children: [
                _i3.RouteConfig(SignUpRoute.name,
                    path: '', parent: SignUpRouter.name),
                _i3.RouteConfig(PasswordRoute.name,
                    path: 'password', parent: SignUpRouter.name),
                _i3.RouteConfig(PhoneVerificationRoute.name,
                    path: 'phone_verification', parent: SignUpRouter.name)
              ]),
          _i3.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: RootRouter.name,
              children: [
                _i3.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i3.RouteConfig(CenterDetailsRoute.name,
                    path: 'center_details', parent: HomeRouter.name),
                _i3.RouteConfig(ProfileRouter.name,
                    path: 'profile', parent: HomeRouter.name)
              ]),
          _i3.RouteConfig(NearMeRouter.name,
              path: 'near_me', parent: RootRouter.name),
          _i3.RouteConfig(PharmacyRouter.name,
              path: 'pharmacy',
              parent: RootRouter.name,
              children: [
                _i3.RouteConfig(PharmacyRoute.name,
                    path: '', parent: PharmacyRouter.name),
                _i3.RouteConfig(CatalogueRoute.name,
                    path: 'catalogue', parent: PharmacyRouter.name),
                _i3.RouteConfig(DrugDetailRoute.name,
                    path: 'drug_details', parent: PharmacyRouter.name)
              ]),
          _i3.RouteConfig(OrdersRouter.name,
              path: 'orders',
              parent: RootRouter.name,
              children: [
                _i3.RouteConfig(OrdersRoute.name,
                    path: '', parent: OrdersRouter.name)
              ]),
          _i3.RouteConfig(RatingsRouter.name,
              path: 'ratings',
              parent: RootRouter.name,
              children: [
                _i3.RouteConfig(RatingsRoute.name,
                    path: '', parent: RatingsRouter.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.RootPage]
class RootRouter extends _i3.PageRouteInfo<void> {
  const RootRouter({List<_i3.PageRouteInfo>? children})
      : super(RootRouter.name, path: '/', initialChildren: children);

  static const String name = 'RootRouter';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i3.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i4.Key? key})
      : super(SignInRoute.name,
            path: 'sign_in', args: SignInRouteArgs(key: key));

  static const String name = 'SignInRoute';
}

class SignInRouteArgs {
  const SignInRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'SignInRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.HealPointPage]
class HealPointRoute extends _i3.PageRouteInfo<void> {
  const HealPointRoute() : super(HealPointRoute.name, path: 'heal_point');

  static const String name = 'HealPointRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SignUpRouter extends _i3.PageRouteInfo<void> {
  const SignUpRouter({List<_i3.PageRouteInfo>? children})
      : super(SignUpRouter.name, path: 'sign_up', initialChildren: children);

  static const String name = 'SignUpRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter({List<_i3.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i2.NearMePage]
class NearMeRouter extends _i3.PageRouteInfo<void> {
  const NearMeRouter() : super(NearMeRouter.name, path: 'near_me');

  static const String name = 'NearMeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class PharmacyRouter extends _i3.PageRouteInfo<void> {
  const PharmacyRouter({List<_i3.PageRouteInfo>? children})
      : super(PharmacyRouter.name, path: 'pharmacy', initialChildren: children);

  static const String name = 'PharmacyRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class OrdersRouter extends _i3.PageRouteInfo<void> {
  const OrdersRouter({List<_i3.PageRouteInfo>? children})
      : super(OrdersRouter.name, path: 'orders', initialChildren: children);

  static const String name = 'OrdersRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class RatingsRouter extends _i3.PageRouteInfo<void> {
  const RatingsRouter({List<_i3.PageRouteInfo>? children})
      : super(RatingsRouter.name, path: 'ratings', initialChildren: children);

  static const String name = 'RatingsRouter';
}

/// generated route for
/// [_i2.SignUpPage]
class SignUpRoute extends _i3.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i2.PasswordPage]
class PasswordRoute extends _i3.PageRouteInfo<void> {
  const PasswordRoute() : super(PasswordRoute.name, path: 'password');

  static const String name = 'PasswordRoute';
}

/// generated route for
/// [_i2.PhoneVerificationPage]
class PhoneVerificationRoute extends _i3.PageRouteInfo<void> {
  const PhoneVerificationRoute()
      : super(PhoneVerificationRoute.name, path: 'phone_verification');

  static const String name = 'PhoneVerificationRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.CenterDetailsPage]
class CenterDetailsRoute extends _i3.PageRouteInfo<CenterDetailsRouteArgs> {
  CenterDetailsRoute({_i4.Key? key})
      : super(CenterDetailsRoute.name,
            path: 'center_details', args: CenterDetailsRouteArgs(key: key));

  static const String name = 'CenterDetailsRoute';
}

class CenterDetailsRouteArgs {
  const CenterDetailsRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'CenterDetailsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.ProfilePage]
class ProfileRouter extends _i3.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'profile');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i2.PharmacyPage]
class PharmacyRoute extends _i3.PageRouteInfo<void> {
  const PharmacyRoute() : super(PharmacyRoute.name, path: '');

  static const String name = 'PharmacyRoute';
}

/// generated route for
/// [_i2.CataloguePage]
class CatalogueRoute extends _i3.PageRouteInfo<void> {
  const CatalogueRoute() : super(CatalogueRoute.name, path: 'catalogue');

  static const String name = 'CatalogueRoute';
}

/// generated route for
/// [_i2.DrugDetailPage]
class DrugDetailRoute extends _i3.PageRouteInfo<void> {
  const DrugDetailRoute() : super(DrugDetailRoute.name, path: 'drug_details');

  static const String name = 'DrugDetailRoute';
}

/// generated route for
/// [_i2.OrdersPage]
class OrdersRoute extends _i3.PageRouteInfo<void> {
  const OrdersRoute() : super(OrdersRoute.name, path: '');

  static const String name = 'OrdersRoute';
}

/// generated route for
/// [_i2.RatingsPage]
class RatingsRoute extends _i3.PageRouteInfo<void> {
  const RatingsRoute() : super(RatingsRoute.name, path: '');

  static const String name = 'RatingsRoute';
}
