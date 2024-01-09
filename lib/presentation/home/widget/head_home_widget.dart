import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';

class HeadHomeWidget extends StatelessWidget {
  final ChangeValueTimerBloc changeValueTimerBloc;
  final Widget appBarHomeWidget;
  final Widget child;
  final double percent;

  const HeadHomeWidget({
    Key? key,
    required this.changeValueTimerBloc,
    required this.appBarHomeWidget,
    required this.child,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .45,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              color: StudyFlowColors.primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  appBarHomeWidget,
                ],
              ),
            ),
          ),
          Positioned(
            top: 130,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CircularPercentIndicator(
                  radius: 72,
                  lineWidth: 8,
                  percent: percent,
                  center: child,
                  backgroundColor: StudyFlowColors.primary,
                  progressColor: StudyFlowColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
