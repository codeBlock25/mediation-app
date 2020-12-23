import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:meditaion/constant/theme.dart';
import 'package:shimmer/shimmer.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  PageController _controller = PageController();
  List<Color> bgColor = [Colors.blue[800], Colors.red[700], Colors.green];
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedContainer(
        curve: Curves.elasticInOut,
        duration: Duration(milliseconds: 700),
        width: Get.width,
        height: Get.height,
        color: bgColor[currentPage],
        child: Stack(
          children: [
            Positioned.fill(
                child: Opacity(
                    opacity: 0.7,
                    child: Image.asset("assets/images/pic2.jpg",
                        fit: BoxFit.cover))),
            Positioned.fill(
              child: PageView(
                controller: _controller,
                physics: ClampingScrollPhysics(),
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  _Page1(),
                  _Page2(),
                  _Page3(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20 + bottomPadding),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Text(
          "Lorem run idd skut ds.",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non maecenas id adipiscing nullam cras diam. Vitae, quisque libero mi erat ven. ilisis. Sed nec urna tempus sed. A cum viverra tincidunt sit pellentesque Vitae ",
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey[500],
            child: Text(
              "swipe to next".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}

class _Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20 + bottomPadding),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Text(
          "Lorem run idd skut ds.",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non maecenas id adipiscing nullam cras diam. Vitae, quisque libero mi erat ven. ilisis. Sed nec urna tempus sed. A cum viverra tincidunt sit pellentesque Vitae ",
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: Colors.grey[500],
            child: Text(
              "swipe to next".toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ]),
    );
  }
}

class _Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      width: Get.width,
      height: Get.height,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 20 + bottomPadding),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Text(
          "Lorem run idd skut ds.",
          style: TextStyle(
              color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non maecenas id adipiscing nullam cras diam. Vitae, quisque libero mi erat ven. ilisis. Sed nec urna tempus sed. A cum viverra tincidunt sit pellentesque Vitae ",
            style: TextStyle(
                color: Colors.grey[300],
                fontSize: 18,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          FlatButton(
              onPressed: () {
                Get.toNamed("/signup");
              },
              color: Colors.grey[900],
              height: 50,
              splashColor: defaultColor.withOpacity(0.3),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 16, color: defaultColor),
              ),
              minWidth: 150),
          FlatButton(
            onPressed: () {
              Get.toNamed("/signin");
            },
            color: defaultColor,
            height: 50,
            splashColor: Colors.grey[900].withOpacity(0.3),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Sign In",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            minWidth: 150,
          )
        ])
      ]),
    );
  }
}
