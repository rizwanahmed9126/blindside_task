import 'package:blind_side/providers/cmnts_plus_upload_provider.dart';
import 'package:blind_side/providers/home_provider.dart';
import 'package:blind_side/providers/user_provider.dart';
import 'package:blind_side/services/navigation_service.dart';
import 'package:blind_side/utils/routes.dart';
import 'package:blind_side/utils/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   setupLocator();
  runApp(
    MyApp(),

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => UploadProvider()),

      ],
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Blindside Task',
            color: Theme.of(context).backgroundColor,
            debugShowCheckedModeBanner: false,
            navigatorKey: locator<NavigationService>().navigatorKey,

            theme: ThemeData(
              fontFamily: 'Lexend',
              backgroundColor: Color.fromRGBO(
                30,
                144,
                241,
                1,
              ),
            ),
            //
            onGenerateRoute: onGenerateRoute,
            initialRoute: SplashScreenRoute,


          );
        },

      ),
    );


  }
}



