
import 'package:blind_side/view/screen/home_screen.dart';
import 'package:blind_side/view/screen/overview_screen.dart';
import 'package:blind_side/view/screen/profile_screen.dart';
import 'package:blind_side/view/screen/signup_screen.dart';
import 'package:blind_side/view/screen/uploaded_videos_screen.dart';
import 'package:flutter/material.dart';

import '../view/screen/login_screen.dart';
import '../view/screen/splash_screen.dart';
import '../view/screen/upload_screen.dart';
import '../view/screen/upload_screen_2.dart';


const SplashScreenRoute = '/splash-screen';
const LoginScreenRoute = '/login-screen';
const SignUpScreenRoute='/signup-screen';
const UploadScreenRoute='/upload-screen';
const UploadScreenRoute2='/upload-screen2';
const UploadedVideosRoute='/uploaded-videos-screen';
//const OverViewScreenRoute='/overview-screen';
const HomeScreenRoute='/main-home-screen';
const ProfileScreenRoute='/profile-screen';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => SplashScreen());

    case LoginScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen());

    case SignUpScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => SignUpScreen());

    case UploadScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => UploadScreen());

    case UploadedVideosRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => UploadScreen());

    case UploadScreenRoute2:
      return MaterialPageRoute(
          builder: (BuildContext context) => UploadScreen2());


    // case OverViewScreenRoute:
    //   return MaterialPageRoute(
    //       builder: (BuildContext context) => OverviewScreen());

    case HomeScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen());

    case ProfileScreenRoute:
      return MaterialPageRoute(
          builder: (BuildContext context) => ProfileScreen());

    default:
      return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen());
  }
}
