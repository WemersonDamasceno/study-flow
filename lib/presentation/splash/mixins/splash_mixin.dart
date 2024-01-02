import 'package:flutter/material.dart';
import 'package:study_flow/presentation/splash/view/splash_view.dart';

mixin SplashMixin {
  void navigationPage({required bool hasToken}) async {
    if (hasToken) {
      MaterialPageRoute(
        builder: (context) => const SplashView(),
      );
      return;
    }
    MaterialPageRoute(
      builder: (context) => const SplashView(),
    );
  }
}
