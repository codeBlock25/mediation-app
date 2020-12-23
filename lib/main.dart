import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:meditaion/screen/accounts/signin.dart';
import 'package:meditaion/screen/accounts/signup.dart';
import 'package:meditaion/screen/app/index.dart';
import 'package:meditaion/screen/launch/index.dart';
import 'package:meditaion/screen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFFA6DB8C),
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      getPages: <GetPage>[
        GetPage(
          name: "/launch",
          title: "Launch Screen",
          page: () => LaunchScreen(),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: "/signup",
          title: "Sign Up Screen",
          page: () => SignUp(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: "/signin",
          title: "Sign In Screen",
          page: () => SignIn(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: "/app_home",
          title: "App Home Screen",
          page: () => AppHome(),
          transition: Transition.downToUp,
        ),
      ],
    );
  }
}
