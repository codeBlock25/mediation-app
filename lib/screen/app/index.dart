import 'dart:io';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:meditaion/components/devotion_view.dart';
import 'package:meditaion/constant/theme.dart';
import 'package:simple_moment/simple_moment.dart';
import "dart:math" as Math;

import 'package:unicons/unicons.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class DevotionlTemp {
  String date;
  String title;
  bool isRead;
  bool canRead;
  Color bgColor;
  DevotionlTemp(date, title, isRead, canRead, bgColor);
}

class _AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  bool navOpen = false;
  AnimationController _animationController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    setState(() {
      _pageController =
          PageController(viewportFraction: 0.9, keepPage: true, initialPage: 0);
      _animationController = AnimationController(
          vsync: this, duration: Duration(milliseconds: 450));
    });
  }

  void _handleOnNavPress() {
    setState(() {
      navOpen = !navOpen;
      navOpen ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    // double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned.fill(
          child: Container(
        width: Get.width,
        height: Get.height,
        color: defaultColor,
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: topPadding + 60,
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                "Meditation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Explore",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Meditation Sound",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Audio books",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Feedback / Testimonals",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Rate this App",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Share with friends",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "Settings",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
            FlatButton.icon(
              onPressed: () {
                exit(0);
              },
              icon: Icon(UniconsLine.exit),
              label: Text(
                "Exit App",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              color: Colors.black.withOpacity(0.05),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              height: 50,
              minWidth: 100,
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      )),
      GestureDetector(
        onTap: () {
          setState(() {
            navOpen = false;
            _animationController.reverse();
          });
        },
        child: AnimatedContainer(
          width: Get.width,
          height: Get.height,
          curve: Curves.elasticInOut,
          duration: Duration(milliseconds: 400),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    spreadRadius: 20,
                    blurRadius: 5,
                    offset: Offset(-20, 30))
              ],
              borderRadius: BorderRadius.circular(navOpen ? 30 : 0),
              image: DecorationImage(
                  image: AssetImage("assets/images/pic5.jpg"),
                  fit: BoxFit.cover)),
          transform: new Matrix4.translationValues(
              navOpen ? Get.width - 150 : 1.0,
              navOpen ? Get.height / 4.5 : 1.0,
              0)
            ..scale(navOpen ? 0.6 : 1.0)
            ..rotateZ(navOpen ? 0.05 : 0.0),
          child: IgnorePointer(
            ignoring: navOpen,
            child: AnimatedContainer(
              width: Get.width,
              height: Get.height,
              curve: Curves.elasticInOut,
              duration: Duration(milliseconds: 400),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.92),
                borderRadius: BorderRadius.circular(navOpen ? 30 : 0),
              ),
              padding: EdgeInsets.only(top: topPadding + 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Hello Daniel",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: Get.width,
                        padding: EdgeInsets.only(left: 20, bottom: 10, top: 20),
                        child: Text(
                          "Offers from us.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        )),
                    LimitedBox(
                      maxHeight: Get.height / 5,
                      maxWidth: Get.width,
                      child: PageView(
                        controller: _pageController,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: Get.width,
                            height: Get.height / 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/pic6.png"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 0,
                                      offset: Offset(0, 10))
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: Get.width,
                            height: Get.height / 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/pic7.png"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 0,
                                      offset: Offset(0, 10))
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            width: Get.width,
                            height: Get.height / 5,
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assets/images/pic8.png"),
                                    fit: BoxFit.cover),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 0,
                                      offset: Offset(0, 10))
                                ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your daily guild".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Devotations".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    LimitedBox(
                      maxHeight: Math.max(Get.width / 3.5 - 20, 180),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return DevotionalView(
                              title: "New title for $index",
                              bgColor: colorWheel[index],
                              date: Moment.now().add(days: index).format("dd"),
                              isRead: index % 2 == 0,
                              canRead: index % 2 != 0,
                            );
                          }),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your audio".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Audio Message".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    LimitedBox(
                      maxHeight: Math.max(Get.width / 3.5 - 20, 180),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return DevotionalView(
                              title: "New title for $index",
                              bgColor: colorWheel[index],
                              date: Moment.now().add(days: index).format("dd"),
                              isRead: index % 2 == 0,
                              canRead: index % 2 != 0,
                            );
                          }),
                    ),
                    Container(
                      width: Get.width,
                      padding: EdgeInsets.only(top: 20, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sounds of music".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Top Selection".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    LimitedBox(
                      maxHeight: Math.max(Get.width / 3.5 - 20, 180),
                      child: ListView.builder(
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return DevotionalViewAudio(
                              title: "Audio file",
                              bgColor: colorWheel[index],
                              lenght: "30:10 mins",
                              bgImage: "assets/images/songs/$index.png",
                            );
                          }),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
          top: topPadding + 10,
          left: 10,
          child: IconButton(
            iconSize: 35,
            splashColor: Colors.white.withOpacity(0.2),
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animationController,
            ),
            onPressed: () => _handleOnNavPress(),
          ))
    ]));
  }
}
