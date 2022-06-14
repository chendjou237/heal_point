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
import 'package:flutter/material.dart' as _i4;

import '../screens/patients/home_services.dart' as _i3;
import '../screens/screens.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    RootRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HealPointPage());
    },
    DoctorScreensRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorScreensPage());
    },
    NurseScreensRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NurseScreensPage());
    },
    EmptyRouterRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    ServicesRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    PharmacyRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    NotificationsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotificationsPage());
    },
    ProfileRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ProfilePage());
    },
    DoctorChatPlanRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorChatPlanPage());
    },
    ServicesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.ServicesPage());
    },
    HomeServicesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeServicesPage());
    },
    OnlineServicesRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnlineServicesPage());
    },
    ChatRoomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatRoomRouteArgs>();
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i1.ChatRoomPage(key: args.key, timeLeft: args.timeLeft));
    },
    PharmacyRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.PharmacyPage());
    },
    CatalogueRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CataloguePage());
    },
    DoctorRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    DoctorCallsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorCallsPage());
    },
    DoctorAppointmentsRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorAppointmentsPage());
    },
    DoctorProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorProfilePage());
    },
    DoctorHomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorHomePage());
    },
    DoctorChatRoomRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorChatRoomPage());
    },
    NurseRouter.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.EmptyRouterPage());
    },
    NursePersonalRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NursePersonalPage());
    },
    NurseProfileRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NurseProfilePage());
    },
    NurseHomeRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NurseHomePage());
    },
    SignInRoute.name: (routeData) {
      final args = routeData.argsAs<SignInRouteArgs>(
          orElse: () => const SignInRouteArgs());
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SignInPage(key: args.key));
    },
    DoctorSignInRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DoctorSignInPage());
    },
    NurseSignInRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NurseSignInPage());
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
                _i2.RouteConfig(ProfileRouter.name,
                    path: 'account', parent: HomeRouter.name),
                _i2.RouteConfig(DoctorChatPlanRoute.name,
                    path: 'doctor_chat_plan', parent: HomeRouter.name)
              ]),
          _i2.RouteConfig(ServicesRouter.name,
              path: 'services',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(ServicesRoute.name,
                    path: '', parent: ServicesRouter.name),
                _i2.RouteConfig(HomeServicesRoute.name,
                    path: 'home_service', parent: ServicesRouter.name),
                _i2.RouteConfig(OnlineServicesRoute.name,
                    path: 'online_services', parent: ServicesRouter.name),
                _i2.RouteConfig(ChatRoomRoute.name,
                    path: 'chat_room', parent: ServicesRouter.name)
              ]),
          _i2.RouteConfig(PharmacyRouter.name,
              path: 'pharmacy',
              parent: RootRouter.name,
              children: [
                _i2.RouteConfig(PharmacyRoute.name,
                    path: '', parent: PharmacyRouter.name),
                _i2.RouteConfig(CatalogueRoute.name,
                    path: 'catalogue', parent: PharmacyRouter.name)
              ])
        ]),
        _i2.RouteConfig(DoctorScreensRouter.name, path: '/doctor', children: [
          _i2.RouteConfig(DoctorRouter.name,
              path: 'doctor_home',
              parent: DoctorScreensRouter.name,
              children: [
                _i2.RouteConfig(DoctorHomeRoute.name,
                    path: '', parent: DoctorRouter.name),
                _i2.RouteConfig(DoctorChatRoomRoute.name,
                    path: 'doctor_chat_room', parent: DoctorRouter.name)
              ]),
          _i2.RouteConfig(DoctorCallsRoute.name,
              path: 'doctor_calls', parent: DoctorScreensRouter.name),
          _i2.RouteConfig(DoctorAppointmentsRoute.name,
              path: 'doctor_appointments', parent: DoctorScreensRouter.name),
          _i2.RouteConfig(DoctorProfileRoute.name,
              path: 'doctor_profile', parent: DoctorScreensRouter.name)
        ]),
        _i2.RouteConfig(NurseScreensRouter.name, path: '/nurse', children: [
          _i2.RouteConfig(NurseRouter.name,
              path: 'nurse_home',
              parent: NurseScreensRouter.name,
              children: [
                _i2.RouteConfig(NurseHomeRoute.name,
                    path: '', parent: NurseRouter.name)
              ]),
          _i2.RouteConfig(NursePersonalRoute.name,
              path: 'nurse_personal', parent: NurseScreensRouter.name),
          _i2.RouteConfig(NurseProfileRoute.name,
              path: 'nurse_profile', parent: NurseScreensRouter.name)
        ]),
        _i2.RouteConfig(EmptyRouterRoute.name,
            path: '/authentication',
            children: [
              _i2.RouteConfig(SignInRoute.name,
                  path: '', parent: EmptyRouterRoute.name),
              _i2.RouteConfig(DoctorSignInRoute.name,
                  path: 'doctor_sign_in', parent: EmptyRouterRoute.name),
              _i2.RouteConfig(NurseSignInRoute.name,
                  path: 'nurse_sign_in', parent: EmptyRouterRoute.name),
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
/// [_i1.DoctorScreensPage]
class DoctorScreensRouter extends _i2.PageRouteInfo<void> {
  const DoctorScreensRouter({List<_i2.PageRouteInfo>? children})
      : super(DoctorScreensRouter.name,
            path: '/doctor', initialChildren: children);

  static const String name = 'DoctorScreensRouter';
}

/// generated route for
/// [_i1.NurseScreensPage]
class NurseScreensRouter extends _i2.PageRouteInfo<void> {
  const NurseScreensRouter({List<_i2.PageRouteInfo>? children})
      : super(NurseScreensRouter.name,
            path: '/nurse', initialChildren: children);

  static const String name = 'NurseScreensRouter';
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
class ServicesRouter extends _i2.PageRouteInfo<void> {
  const ServicesRouter({List<_i2.PageRouteInfo>? children})
      : super(ServicesRouter.name, path: 'services', initialChildren: children);

  static const String name = 'ServicesRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class PharmacyRouter extends _i2.PageRouteInfo<void> {
  const PharmacyRouter({List<_i2.PageRouteInfo>? children})
      : super(PharmacyRouter.name, path: 'pharmacy', initialChildren: children);

  static const String name = 'PharmacyRouter';
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
/// [_i1.ProfilePage]
class ProfileRouter extends _i2.PageRouteInfo<void> {
  const ProfileRouter() : super(ProfileRouter.name, path: 'account');

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i1.DoctorChatPlanPage]
class DoctorChatPlanRoute extends _i2.PageRouteInfo<void> {
  const DoctorChatPlanRoute()
      : super(DoctorChatPlanRoute.name, path: 'doctor_chat_plan');

  static const String name = 'DoctorChatPlanRoute';
}

/// generated route for
/// [_i1.ServicesPage]
class ServicesRoute extends _i2.PageRouteInfo<void> {
  const ServicesRoute() : super(ServicesRoute.name, path: '');

  static const String name = 'ServicesRoute';
}

/// generated route for
/// [_i3.HomeServicesPage]
class HomeServicesRoute extends _i2.PageRouteInfo<void> {
  const HomeServicesRoute()
      : super(HomeServicesRoute.name, path: 'home_service');

  static const String name = 'HomeServicesRoute';
}

/// generated route for
/// [_i1.OnlineServicesPage]
class OnlineServicesRoute extends _i2.PageRouteInfo<void> {
  const OnlineServicesRoute()
      : super(OnlineServicesRoute.name, path: 'online_services');

  static const String name = 'OnlineServicesRoute';
}

/// generated route for
/// [_i1.ChatRoomPage]
class ChatRoomRoute extends _i2.PageRouteInfo<ChatRoomRouteArgs> {
  ChatRoomRoute({_i4.Key? key, required int timeLeft})
      : super(ChatRoomRoute.name,
            path: 'chat_room',
            args: ChatRoomRouteArgs(key: key, timeLeft: timeLeft));

  static const String name = 'ChatRoomRoute';
}

class ChatRoomRouteArgs {
  const ChatRoomRouteArgs({this.key, required this.timeLeft});

  final _i4.Key? key;

  final int timeLeft;

  @override
  String toString() {
    return 'ChatRoomRouteArgs{key: $key, timeLeft: $timeLeft}';
  }
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
/// [_i2.EmptyRouterPage]
class DoctorRouter extends _i2.PageRouteInfo<void> {
  const DoctorRouter({List<_i2.PageRouteInfo>? children})
      : super(DoctorRouter.name,
            path: 'doctor_home', initialChildren: children);

  static const String name = 'DoctorRouter';
}

/// generated route for
/// [_i1.DoctorCallsPage]
class DoctorCallsRoute extends _i2.PageRouteInfo<void> {
  const DoctorCallsRoute() : super(DoctorCallsRoute.name, path: 'doctor_calls');

  static const String name = 'DoctorCallsRoute';
}

/// generated route for
/// [_i1.DoctorAppointmentsPage]
class DoctorAppointmentsRoute extends _i2.PageRouteInfo<void> {
  const DoctorAppointmentsRoute()
      : super(DoctorAppointmentsRoute.name, path: 'doctor_appointments');

  static const String name = 'DoctorAppointmentsRoute';
}

/// generated route for
/// [_i1.DoctorProfilePage]
class DoctorProfileRoute extends _i2.PageRouteInfo<void> {
  const DoctorProfileRoute()
      : super(DoctorProfileRoute.name, path: 'doctor_profile');

  static const String name = 'DoctorProfileRoute';
}

/// generated route for
/// [_i1.DoctorHomePage]
class DoctorHomeRoute extends _i2.PageRouteInfo<void> {
  const DoctorHomeRoute() : super(DoctorHomeRoute.name, path: '');

  static const String name = 'DoctorHomeRoute';
}

/// generated route for
/// [_i1.DoctorChatRoomPage]
class DoctorChatRoomRoute extends _i2.PageRouteInfo<void> {
  const DoctorChatRoomRoute()
      : super(DoctorChatRoomRoute.name, path: 'doctor_chat_room');

  static const String name = 'DoctorChatRoomRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class NurseRouter extends _i2.PageRouteInfo<void> {
  const NurseRouter({List<_i2.PageRouteInfo>? children})
      : super(NurseRouter.name, path: 'nurse_home', initialChildren: children);

  static const String name = 'NurseRouter';
}

/// generated route for
/// [_i1.NursePersonalPage]
class NursePersonalRoute extends _i2.PageRouteInfo<void> {
  const NursePersonalRoute()
      : super(NursePersonalRoute.name, path: 'nurse_personal');

  static const String name = 'NursePersonalRoute';
}

/// generated route for
/// [_i1.NurseProfilePage]
class NurseProfileRoute extends _i2.PageRouteInfo<void> {
  const NurseProfileRoute()
      : super(NurseProfileRoute.name, path: 'nurse_profile');

  static const String name = 'NurseProfileRoute';
}

/// generated route for
/// [_i1.NurseHomePage]
class NurseHomeRoute extends _i2.PageRouteInfo<void> {
  const NurseHomeRoute() : super(NurseHomeRoute.name, path: '');

  static const String name = 'NurseHomeRoute';
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i2.PageRouteInfo<SignInRouteArgs> {
  SignInRoute({_i4.Key? key})
      : super(SignInRoute.name, path: '', args: SignInRouteArgs(key: key));

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
/// [_i1.DoctorSignInPage]
class DoctorSignInRoute extends _i2.PageRouteInfo<void> {
  const DoctorSignInRoute()
      : super(DoctorSignInRoute.name, path: 'doctor_sign_in');

  static const String name = 'DoctorSignInRoute';
}

/// generated route for
/// [_i1.NurseSignInPage]
class NurseSignInRoute extends _i2.PageRouteInfo<void> {
  const NurseSignInRoute()
      : super(NurseSignInRoute.name, path: 'nurse_sign_in');

  static const String name = 'NurseSignInRoute';
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
