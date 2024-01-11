import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class InputFormWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final FontWeight? fontWeight;

  const InputFormWidget({
    Key? key,
    this.fontWeight,
    required this.label,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: StudyFlowColors.secondary,
              fontSize: 18,
              fontWeight: fontWeight ?? FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: StudyFlowColors.secondary,
                width: 1,
              ),
            ),
            child: TextFormField(
              controller: controller,
              cursorColor: StudyFlowColors.secondary,
              decoration: InputDecoration(
                labelStyle: const TextStyle(fontSize: 20),
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
