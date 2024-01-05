import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class TextWithBorderWidget extends StatelessWidget {
  final String text;
  const TextWithBorderWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: StudyFlowColors.secondary,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: StudyFlowColors.secondary,
          fontSize: 16,
        ),
      ),
    );
  }
}
