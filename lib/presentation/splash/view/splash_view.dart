import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/icons/study_flow_icons.dart';
import 'package:study_flow/core/utils/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void navigationPage() async {
    String? name = await SharedPref().read("name") as String?;
    Future.delayed(const Duration(seconds: 3), () {
      if (name != null) {
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      } else {
        MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    navigationPage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * .5,
                child: LottieBuilder.asset(
                  StudyFlowIcons().animationIcon,
                ),
              ),
              Text(
                "Study Flow",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: StudyFlowColors().secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
