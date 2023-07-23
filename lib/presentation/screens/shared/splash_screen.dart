import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/image_constant.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/custom_image_view.dart';

import '../../../constants/mycolors.dart';
import '../../../constants/strings.dart';

class SplashScreen extends StatefulWidget {
  String? name, phone;
  SplashScreen({super.key, required this.name, required this.phone});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool visible = false;
  double opacity = 0;
  void initState() {
    super.initState();
    String secondScreen = loginScreen;
    if (widget.name != null && widget.phone != null) {
      secondScreen = homeScreen;
    }
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        opacity = 1;
      });
    });
    Timer(const Duration(milliseconds: 3500), () {
      Navigator.popAndPushNamed(
        context,
        secondScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.myBlue,
      body: AnimatedOpacity(
        opacity: opacity,
        duration: const Duration(milliseconds: 1000),
        child: SizedBox(
          height: height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstants.splashbackground,
                height: height * 0.9,
                width: width,
                alignment: Alignment.center,
              ),
              CustomImageView(
                imagePath: ImageConstants.logo,
                height: height * 0.25,
                width: width * 0.7,
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
