import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class ButtonMainWidget extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;

  const ButtonMainWidget({
    Key? key,
    required this.child,
    required this.onPressed,
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
        backgroundColor: StudyFlowColors.secondary,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        minimumSize: Size(size.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      onPressed: () {
        widget.onPressed();
      },
      child: widget.child,
    );
  }
}
