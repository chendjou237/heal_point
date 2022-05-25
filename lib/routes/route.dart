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
    
      children: [
       
        
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page:EmptyRouterPage,
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
          path: 'doctors',
          name: 'DoctorsRouter',
          page: EmptyRouterPage,
          children: [
           
            AutoRoute(
              path: '',
              page: DoctorsPage,
            ),
           
           
          
          ],
        ),  
           AutoRoute(
          path: 'health_cares',
          name: 'HealthCaresRouter',
          page: EmptyRouterPage,
          children: [
          
            AutoRoute(
              path: '',
              page: HealthCaresPage,
            ),
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
