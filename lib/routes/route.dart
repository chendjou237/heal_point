import 'package:auto_route/auto_route.dart';
import 'package:heal_point/utilities/root.dart';

import '../screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'RootRouter',
      page: RootPage,
      initial: true,
      children: [
       
        AutoRoute(
          path: 'sign_in',
          page: SignInPage,
        ),
        AutoRoute(
          path: 'heal_point',
          page: HealPointPage,
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
        AutoRoute(
          path: 'home',
          name: 'homeRouter',
          page: EmptyRouterPage,
          children: [
         AutoRoute(
           path: '',
           page: HomePage,
         ),
         AutoRoute(
           path: 'center_details',
           page: CenterDetailsPage,
         ),
         AutoRoute(
           path: 'profile',
           name: 'ProfileRouter',
           page: ProfilePage,
         ),
          ],
        ),
        AutoRoute(
          path: 'near_me',
          name: 'NearMeRouter',
          page: NearMePage,
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
         AutoRoute(
           path: 'drug_details',
           page: DrugDetailPage,
         ),
          ],
        ),
        AutoRoute(
          path: 'orders',
          name: 'OrdersRouter',
          page: EmptyRouterPage,
          children: [
         AutoRoute(
           path: '',
           page: OrdersPage,
         )
          ],
        ),
        AutoRoute(
          path: 'ratings',
          name: 'RatingsRouter',
          page: EmptyRouterPage,
          children: [
         AutoRoute(
           path: '',
           page: RatingsPage,
         ),
          ],
        ),],
    ),
      
  ],
)
class $AppRouter {}
