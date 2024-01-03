import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/icons/study_flow_icons.dart';

class SuccessScreenWidget extends StatelessWidget {
  const SuccessScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .5,
            child: LottieBuilder.asset(
              StudyFlowIcons.animationIcon,
            ),
          ),
          Text(
            "Study Flow",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: StudyFlowColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
