import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class ButtonOptionsWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  const ButtonOptionsWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: StudyFlowColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
