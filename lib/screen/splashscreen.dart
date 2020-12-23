import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meditaion/constant/theme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class CirclePosition {
  double dx;
  double dy;
}

class _SplashScreenState extends State<SplashScreen> {
  CirclePosition c1 = CirclePosition();
  CirclePosition c2 = CirclePosition();
  CirclePosition c3 = CirclePosition();
  CirclePosition c4 = CirclePosition();
  CirclePosition c5 = CirclePosition();
  void animate() {
    setState(() {
      c1.dx = -Get.width / 3.6;
      c1.dy = -Get.width / 3.6;
      c2.dx = -Get.width / 4;
      c2.dy = -Get.width / 4;
      c3.dx = -Get.width / 1.6;
      c3.dy = -Get.width / 5;
      c4.dx = -Get.width / 3.6;
      c4.dy = -Get.width / 2;
      c5.dx = -Get.width / 8;
      c5.dy = Get.width / 2;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      c1.dx = -Get.width * 1.7;
      c1.dy = -Get.width * 1.7;
      c2.dx = -Get.width;
      c2.dy = -Get.width;
      c3.dx = -Get.width;
      c3.dy = -Get.width;
      c4.dx = -Get.width;
      c4.dy = -Get.width;
      c5.dx = -Get.width * 2;
      c5.dy = Get.width * 2;
    });
    new Timer(Duration(milliseconds: 200), animate);
    new Timer(Duration(seconds: 6), () => Get.offAllNamed("/launch"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child:
                    Image.asset("assets/images/pic1.jpg", fit: BoxFit.cover)),
            Positioned.fill(
                child: Container(
              color: Colors.black.withOpacity(0.4),
            )),
            AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 2000),
                top: c1.dy,
                left: c1.dx,
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      border: Border.all(
                          color: defaultColor,
                          width: 10,
                          style: BorderStyle.solid)),
                )),
            AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 2000),
                top: c2.dy,
                left: c2.dx,
                child: Container(
                  width: Get.width,
                  height: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      border: Border.all(
                          color: defaultColor,
                          width: 10,
                          style: BorderStyle.solid)),
                )),
            AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 2000),
                bottom: c3.dy,
                right: c3.dx,
                child: Container(
                  width: Get.width,
                  height: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      border: Border.all(
                          color: defaultColor,
                          width: 10,
                          style: BorderStyle.solid)),
                )),
            AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 2000),
                bottom: c4.dy,
                left: c4.dx,
                child: Container(
                  width: Get.width,
                  height: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      border: Border.all(
                          color: defaultColor,
                          width: 10,
                          style: BorderStyle.solid)),
                )),
            AnimatedPositioned(
                curve: Curves.easeIn,
                duration: Duration(milliseconds: 2000),
                bottom: c5.dy,
                right: c5.dx,
                child: Container(
                  width: Get.width * 1.1,
                  height: Get.width * 1.1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Get.width),
                      border: Border.all(
                          color: defaultColor,
                          width: 10,
                          style: BorderStyle.solid)),
                )),
            Positioned.fill(child: Splash())
          ],
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Meditations",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: Get.height > 650 ? 30 : 25,
                color: defaultColor),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "A daily ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Get.height > 650 ? 22 : 18,
                        color: defaultColor),
                    children: <InlineSpan>[
                      TextSpan(
                        text: "Devotional ",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextSpan(text: "with  "),
                      TextSpan(
                        text: "Prayer Guide.",
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
