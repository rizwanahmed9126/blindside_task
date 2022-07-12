import 'dart:async';
import 'package:blind_side/utils/routes.dart';
import 'package:flutter/material.dart';
import '../../services/navigation_service.dart';
import '../../services/storage_service.dart';
import '../../utils/service_locator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var navigationService = locator<NavigationService>();
  var storageService = locator<StorageService>();


  navigateDecision() async {

    if (await storageService.getBoolData('isShowHome') == true) {

      navigationService.navigateTo(HomeScreenRoute);
    } else {

       navigationService.navigateTo(LoginScreenRoute);
    }
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () async {

      navigateDecision();
    });
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: null,
      child: Stack(
        // fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/splash_1.jpeg'),
                    fit: BoxFit.cover),
              ),
            ),

          ]),
    );
  }
}
