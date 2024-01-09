import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class ButtonMainWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const ButtonMainWidget({
    Key? key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  }) : super(key: key);

  @override
  State<ButtonMainWidget> createState() => _ButtonMainWidgetState();
}

class _ButtonMainWidgetState extends State<ButtonMainWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(size.width, 50),
        backgroundColor: widget.backgroundColor ?? StudyFlowColors.secondary,
        disabledBackgroundColor: StudyFlowColors.successLight,
        foregroundColor: widget.textColor ?? Colors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: widget.borderColor != null
              ? BorderSide(
                  color: widget.borderColor!,
                  width: 2,
                )
              : BorderSide.none,
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: widget.child,
    );
  }
}
