import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({
    Key? key,
    required this.firstNameUser,
    required this.initialsNameUser,
  }) : super(key: key);

  final String firstNameUser;
  final String initialsNameUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: StudyFlowColors.secondary,
          child: Text(
            initialsNameUser,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Olá, $firstNameUser",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.logout_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
