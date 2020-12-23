import "package:flutter/material.dart";
import 'package:get/get.dart';
import "dart:math" as Math;

import 'package:unicons/unicons.dart';

class DevotionalView extends StatelessWidget {
  final String date;
  final String title;
  final bool isRead;
  final bool canRead;
  final MaterialColor bgColor;
  const DevotionalView({
    Key key,
    @required this.date,
    @required this.title,
    @required this.isRead,
    @required this.canRead,
    @required this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      splashColor: Colors.white.withOpacity(0.4),
      child: Container(
        width: Math.max(Get.width / 2.2 - 20, 120),
        height: Math.max(Get.width / 2.2 - 20, 120),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
            color: bgColor[100],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[100].withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, -15)),
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(0, 10))
            ]),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 5,
                right: 5,
                child: Text(
                  isRead ? "read".toUpperCase() : "not read".toUpperCase(),
                  style: TextStyle(
                      color: bgColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 5, right: 5, top: 5),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DevotionalViewAudio extends StatelessWidget {
  final String title;
  final MaterialColor bgColor;
  final String bgImage;
  final String lenght;
  const DevotionalViewAudio({
    Key key,
    @required this.title,
    @required this.bgColor,
    @required this.bgImage,
    @required this.lenght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      splashColor: Colors.white.withOpacity(0.4),
      child: Container(
        width: Get.width / 2,
        height: Get.width / 2,
        decoration: BoxDecoration(
            color: bgColor[100],
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Positioned(
                top: 5,
                right: 5,
                child: Text(
                  lenght,
                  style: TextStyle(
                      color: bgColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                )),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    UniconsLine.play_circle,
                    size: Get.width / 4,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 15, left: 5, right: 5, top: 5),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
