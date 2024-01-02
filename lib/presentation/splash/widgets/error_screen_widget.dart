import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Aconteceu um erro! Tente novamente!",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: StudyFlowColors().secondary,
            ),
          ),
        ],
      ),
    );
  }
}
