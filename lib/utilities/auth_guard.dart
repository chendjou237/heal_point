import 'package:auto_route/auto_route.dart';
//import 'package:heal_point/screens/screens.dart';
import 'package:heal_point/utilities/root.dart';

import '../routes/route.gr.dart';

class AuthGuard extends AutoRouteGuard {    
 @override    
 void onNavigation(NavigationResolver resolver, StackRouter router) {    
 // the navigation is paused until resolver.next() is called with either     
 // true to resume/continue navigation or false to abort navigation    
     if(userState != null){    
       // if user is authenticated we continue    
        resolver.next(true);    
      }else{    
         // we redirect the user to our login page    
         router.push(SignInRoute()
        //  (onResult: (success){    
        //         // if success == true the navigation will be resumed    
        //         // else it will be aborted    
        //        resolver.next(success);    
        //   })
          );    
         }        
     }    
}