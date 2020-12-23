import 'dart:async';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:meditaion/constant/theme.dart';
import "package:unicons/unicons.dart";

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  String firstNameErrTxt = "";
  String lastNameErrTxt = "";
  String emailErrTxt = "";
  String passwordErrTxt = "";
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      firstNameController = TextEditingController();
      lastNameController = TextEditingController();
      emailController = TextEditingController();
      passwordController = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          "assets/images/pic5.jpg",
                          fit: BoxFit.cover,
                        )),
                  ),
                  BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(
                                    top: topPadding + 20, left: 10, right: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30, top: 10, bottom: 15),
                                      child: Text(
                                        "Meditation".toUpperCase(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: defaultColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 30, top: 10, bottom: 15),
                                      child: Text(
                                        "Welcome back to deep meditatiion with the Lord"
                                            .toUpperCase(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "Please provide the following information to get  you signed  in."
                                          .toUpperCase(),
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[600]),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    CustomTextfield(
                                      firstNameController: emailController,
                                      firstNameErrTxt: emailErrTxt,
                                      errorTxt: emailErrTxt,
                                      isPasswordText: false,
                                      label: "Email",
                                      hintText: "Enter your email",
                                      icon: UniconsLine.envelope,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                    CustomTextfield(
                                      firstNameController: passwordController,
                                      firstNameErrTxt: passwordErrTxt,
                                      errorTxt: passwordErrTxt,
                                      isPasswordText: true,
                                      label: "Password",
                                      hintText: "Enter your password.",
                                      icon: UniconsLine.lock,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                    ),
                                    Container(
                                      width: Get.width,
                                      child: RichText(
                                        textAlign: TextAlign.right,
                                        text: TextSpan(
                                            text: "Forgot your password ? ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                  text: "Request Reset",
                                                  style: TextStyle(
                                                      color: defaultColor),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Get.toNamed(
                                                              "/signup");
                                                        })
                                            ]),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 15, left: 10, right: 10),
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Don't have an account? ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16),
                                          children: <InlineSpan>[
                                            TextSpan(
                                                text: "Sign Up",
                                                style: TextStyle(
                                                    color: defaultColor),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Get.toNamed("/signup");
                                                      })
                                          ]),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        bottom: 10 + bottomPadding),
                                    child: SizedBox(
                                      width: 200,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          new Timer(Duration(seconds: 2), () {
                                            Get.offAllNamed("/app_home");
                                          });
                                        },
                                        child: AnimatedContainer(
                                            curve: Curves.elasticInOut,
                                            alignment: Alignment.center,
                                            duration:
                                                Duration(milliseconds: 500),
                                            width: isLoading ? 50 : 200,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: defaultColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: isLoading
                                                ? CircularProgressIndicator(
                                                    backgroundColor:
                                                        Colors.white,
                                                  )
                                                : Text(
                                                    "SignIn",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key key,
    @required this.firstNameController,
    @required this.firstNameErrTxt,
    @required this.label,
    @required this.icon,
    @required this.errorTxt,
    @required this.hintText,
    @required this.isPasswordText,
    @required this.keyboardType,
  }) : super(key: key);

  final TextEditingController firstNameController;
  final String firstNameErrTxt;
  final bool isPasswordText;

  final String hintText;

  final String errorTxt;

  final IconData icon;

  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, left: 10, right: 10),
      child: TextField(
        controller: firstNameController,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
          prefixIcon: Icon(
            icon,
            color: defaultColor,
          ),
          hintText: hintText,
          errorText: firstNameErrTxt,
          errorStyle: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(20),
          fillColor: Colors.black.withOpacity(0.04),
        ),
        obscureText: isPasswordText,
        keyboardType: keyboardType,
        keyboardAppearance: Brightness.light,
      ),
    );
  }
}
