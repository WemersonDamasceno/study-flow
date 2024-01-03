import 'package:flutter/material.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';

mixin SplashMixin {
  void navigationPage(
      {required bool notHaveToken, required BuildContext context}) async {
    if (notHaveToken) {
      Navigator.popAndPushNamed(context, StudyFlowRouters.createAccount);
      return;
    }
    Navigator.popAndPushNamed(context, StudyFlowRouters.splash);
  }
}
