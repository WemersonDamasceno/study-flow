import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class TextWithBorderWidget extends StatelessWidget {
  final Widget child;
  final double radius;
  final double borderWidth;

  const TextWithBorderWidget({
    Key? key,
    required this.child,
    this.radius = 100,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 50,
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: StudyFlowColors.secondary,
          width: borderWidth,
        ),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}
