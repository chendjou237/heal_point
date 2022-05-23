import 'package:auto_route/auto_route.dart';
import 'package:heal_point/routes/route.gr.dart';
import 'package:heal_point/utilities/root.dart';

import '../screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'RootRouter',
      page: HealPointPage,
      initial: true,
      children: [
       
        
        AutoRoute(
          path: 'home',
          name: 'homeRouter',
          page:HomePage,
          children: [
           
            AutoRoute(
              path: 'notifications',
              page: NotificationsPage,
            ),
           
          ],
        ),
        AutoRoute(
          path: 'doctors',
          name: 'doctorsRouter',
          page: DoctorsPage,
          children: [
           
            AutoRoute(
              path: 'doctor_detail',
              page: DoctorDetailsPage,
            ),
           
            AutoRoute(
              path: 'chat_room',
              page: ChatRoomPage,
            ),
          
          ],
        ),  
           AutoRoute(
          path: 'health_cares',
          name: 'HealthCaresRouter',
          page: HealthCaresPage,
          children: [
          
            AutoRoute(
              path: 'center_details',
              page: CenterDetailsPage,
            ),
            AutoRoute(
              path: 'near_me',
              page: NearMePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'pharmacy',
          name: 'PharmacyRouter',
          page: PharmacyPage,
          children: [
           
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
          path: 'account',
          name: 'ProfileRouter',
          page: ProfilePage,
          
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
