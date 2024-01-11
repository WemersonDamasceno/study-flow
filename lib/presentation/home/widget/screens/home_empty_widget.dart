import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:study_flow/core/icons/study_flow_icons.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/utils/get_first_name.dart';
import 'package:study_flow/core/utils/get_initials_name.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/mixin/home_mixin.dart';
import 'package:study_flow/presentation/home/widget/app_bar_home_widget.dart';
import 'package:study_flow/presentation/home/widget/head_home_widget.dart';

class HomeEmptyWidget extends StatelessWidget with HomeMixin {
  final TextEditingController namePomodoroController;
  final QuantityController quantityController;
  final Session session;

  const HomeEmptyWidget({
    Key? key,
    required this.namePomodoroController,
    required this.quantityController,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              HeadHomeWidget(
                percent: 0,
                appBarHomeWidget: AppBarHomeWidget(
                  firstNameUser: getFirstName(session.userEntity!.nameUser),
                  initialsNameUser: getInitialName(
                    session.userEntity!.nameUser,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LottieBuilder.asset(
                    StudyFlowIcons.emptyPomodoro,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Você não possui nenhuma ativididade iniciada, tente adicionar uma atividade para usar o aplicativo.",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonMainWidget(
                  child: const Text("Adicionar Pomodoro"),
                  onPressed: () async {
                    final updateList = await Navigator.pushNamed(
                      context,
                      StudyFlowRouters.addPomodoro,
                    );

                    log(updateList.toString());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
