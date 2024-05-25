import 'dart:async';
import 'package:flutter_udemy_clone_project/Screens/HomeScreen.dart';
import 'package:flutter_udemy_clone_project/Screens/HomeScreens/WishList.dart';
import 'package:flutter_udemy_clone_project/Screens/LandingPage.dart';
import 'package:flutter_udemy_clone_project/Services/PrefStorage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen() : super();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PrefStorage prefStorage = PrefStorage();

  @override
  void initState() {
    super.initState();
    goToNext();
    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {});
    //
    // //on foreground notification
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   if (message.notification?.body == "Notification body") {
    //     Get.to(() => WishList());
    //   }
    // });
    //
    // //on background notification while click on notification
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   if (message.data['id'] == "1") {
    //     Get.to(() => WishList());
    //   }
    // });
  }

  void goToNext() {
   // Navigator.pushReplacement(context, PageTransition(child: LandingPage(), type: PageTransitionType.rightToLeftWithFade));
    Timer(
      Duration(seconds: 3),
          () async => Navigator.pushReplacement(
        context,
        PageTransition(
          child: LandingPage(),//await prefStorage.isLoggedIn() ? HomeScreen() : LandingPage(),
          type: PageTransitionType.rightToLeftWithFade,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.0,
                child: Image.asset("assets/images/e-coursed.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "E-Courses",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
