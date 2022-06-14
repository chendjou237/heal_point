import 'package:auto_route/auto_route.dart';
import 'package:heal_point/screens/patients/home_services.dart';

import '../screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'RootRouter',
      page: HealPointPage,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: HomePage,
            ),
            AutoRoute(
              path: 'notifications',
              page: NotificationsPage,
            ),
            AutoRoute(
              path: 'account',
              name: 'ProfileRouter',
              page: ProfilePage,
            ),
            AutoRoute(
              path: 'doctor_chat_plan',
              page: DoctorChatPlanPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'services',
          name: 'ServicesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ServicesPage,
            ),
            AutoRoute(
              path: 'home_service',
              page: HomeServicesPage,
            ),
            AutoRoute(
              path: 'online_services',
              page: OnlineServicesPage,
            ),
            AutoRoute(
              path: 'chat_room',
              page: ChatRoomPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'pharmacy',
          name: 'PharmacyRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: PharmacyPage,
            ),
            AutoRoute(
              path: 'catalogue',
              page: CataloguePage,
            ),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/doctor',
      name: 'DoctorScreensRouter',
      page: DoctorScreensPage,
      children: [
        AutoRoute(
          path: 'doctor_home',
          name: 'DoctorRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: DoctorHomePage,
            ),
            AutoRoute(
              path: 'doctor_chat_room',
              page: DoctorChatRoomPage,
            ),
          ],
        ),
        AutoRoute(
          path: 'doctor_calls',
          page: DoctorCallsPage,
        ),
        AutoRoute(
          path: 'doctor_appointments',
          page: DoctorAppointmentsPage,
        ),
        AutoRoute(
          path: 'doctor_profile',
          page: DoctorProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: '/nurse',
      name: 'NurseScreensRouter',
      page: NurseScreensPage,
      children: [
        AutoRoute(
          path: 'nurse_home',
          name: 'NurseRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: NurseHomePage,
            ),
            // AutoRoute(
            //   path: 'doctor_chat_room',
            //   page: DoctorChatRoomPage,
            // ),
          ],
        ),
        AutoRoute(
          path: 'nurse_personal',
          page: NursePersonalPage,
        ),
        // AutoRoute(
        //   path: 'doctor_appointments',
        //   page: DoctorAppointmentsPage,
        // ),
        AutoRoute(
          path: 'nurse_profile',
          page: NurseProfilePage,
        ),
      ],
    ),
    AutoRoute(
      path: '/authentication',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: '',
          page: SignInPage,
        ),
        AutoRoute(
          path: 'doctor_sign_in',
          page: DoctorSignInPage,
        ),
        AutoRoute(
          path: 'nurse_sign_in',
          page: NurseSignInPage,
        ),
        AutoRoute(
          path: 'sign_up',
          name: 'SignUpRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: SignUpPage,
            ),
            AutoRoute(
              path: 'password',
              page: PasswordPage,
            ),
            AutoRoute(
              path: 'phone_verification',
              page: PhoneVerificationPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
