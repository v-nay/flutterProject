import 'package:flutter_udemy_clone_project/Screens/HomeScreen.dart';
import 'package:flutter_udemy_clone_project/Screens/SignInOptionScreens/SignInPage.dart';
import 'package:flutter_udemy_clone_project/Services/PrefStorage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_udemy_clone_project/Services/Constants.dart';

class LandingPage extends StatefulWidget {
  LandingPage() : super();

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PrefStorage prefStorage = PrefStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(""),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            //height: 400.0,
            //width: 400.0,
            child: Image.asset(
              "assets/images/Landing_page.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              colorBlendMode: BlendMode.darken,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              child: Text(
                "Browse",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 20.0,
                ),
              ),
              onPressed: ()  {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: SignInPage(),
                      // child: await prefStorage.isLoggedIn()
                      //     ? HomeScreen()
                      //     : SignInPage(),
                      type: PageTransitionType.leftToRightWithFade),
                );
              },
            ),
            MaterialButton(
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.grey.shade300,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => Navigator.pushReplacement(
                context,
                PageTransition(
                  child: SignInPage(),
                    //child: SignInPage(),
                    type: PageTransitionType.leftToRightWithFade),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
