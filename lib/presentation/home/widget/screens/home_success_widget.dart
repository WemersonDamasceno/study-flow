import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/utils/get_first_name.dart';
import 'package:study_flow/core/utils/get_initials_name.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/text_with_border_widget.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/mixin/home_mixin.dart';
import 'package:study_flow/presentation/home/widget/app_bar_home_widget.dart';
import 'package:study_flow/presentation/home/widget/button_options_widget.dart';
import 'package:study_flow/presentation/home/widget/head_home_widget.dart';

class HomeSuccessWidget extends StatefulWidget {
  final TextEditingController namePomodoroController;
  final QuantityController quantityController;
  final CreatePomodoroBloc createPomodoroBloc;
  final PomodoroEntity pomodoroEntity;
  final ChangeValueTimerBloc changeValueTimerBloc;
  final ManagerButtonMainBloc managerButtonMainBloc;
  final Session session;

  const HomeSuccessWidget({
    Key? key,
    required this.namePomodoroController,
    required this.managerButtonMainBloc,
    required this.changeValueTimerBloc,
    required this.quantityController,
    required this.createPomodoroBloc,
    required this.pomodoroEntity,
    required this.session,
  }) : super(key: key);

  @override
  State<HomeSuccessWidget> createState() => _HomeSuccessWidgetState();
}

class _HomeSuccessWidgetState extends State<HomeSuccessWidget> with HomeMixin {
  int _timerTotal = 0;
  int qtdRepeat = 0;
  bool isShortBreak = false;
  String subTitle = "";
  ButtonState buttonState = ButtonState.init;

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timerTotal = convertNumberInMinutes(1);

    widget.changeValueTimerBloc.add(
      ChangeValueTimerEventIncrement(
        value: _timerTotal,
      ),
    );

    subTitle = "$qtdRepeat/${widget.pomodoroEntity.quantityRepeat} repetições";
  }

  void startCountDown() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();

      buttonState = ButtonState.pause;
    } else if (_timer != null && _timer!.isActive == false) {
      buttonState = ButtonState.resume;
    }

    widget.managerButtonMainBloc.add(
      ManagerButtonMain(
        buttonState: buttonState,
        isShotBreak: isShortBreak,
      ),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (buttonState == ButtonState.pause ||
          buttonState == ButtonState.pauseBreak) {
        timer.cancel();
        return;
      }

      if (_timerTotal > 0) {
        _timerTotal--;
        widget.changeValueTimerBloc.add(
          ChangeValueTimerEventIncrement(
            value: _timerTotal,
          ),
        );
      } else {
        timer.cancel();

        if (isShortBreak) {
          buttonState = ButtonState.endBreak;
          isShortBreak = false;
          setState(() {
            _timerTotal = convertNumberInMinutes(1);
            subTitle =
                "$qtdRepeat/${widget.pomodoroEntity.quantityRepeat} repetições";
          });

          widget.managerButtonMainBloc.add(
            ManagerButtonMain(
              buttonState: buttonState,
              isShotBreak: isShortBreak,
            ),
          );
        } else {
          setState(() {
            qtdRepeat++;
            isShortBreak = true;
            buttonState = ButtonState.end;

            widget.managerButtonMainBloc.add(
              ManagerButtonMain(
                buttonState: buttonState,
                isShotBreak: isShortBreak,
              ),
            );
            _timerTotal = convertNumberInMinutes(1);
            subTitle = "Pausa curta";
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  BlocBuilder<ChangeValueTimerBloc, ChangeValueTimerState>(
                    bloc: widget.changeValueTimerBloc,
                    builder: (context, state) {
                      return HeadHomeWidget(
                        percent: state.value,
                        changeValueTimerBloc: widget.changeValueTimerBloc,
                        appBarHomeWidget: AppBarHomeWidget(
                          firstNameUser:
                              getFirstName(widget.session.userEntity!.nameUser),
                          initialsNameUser: getInitialName(
                            widget.session.userEntity!.nameUser,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              formatedTime(_timerTotal),
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: StudyFlowColors.secondary,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              subTitle,
                              style: TextStyle(
                                fontSize: 15,
                                color: StudyFlowColors.secondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlocBuilder<ManagerButtonMainBloc,
                          ManagerButtonMainState>(
                        bloc: widget.managerButtonMainBloc,
                        builder: (context, state) {
                          return ButtonMainWidget(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.play_arrow),
                                const SizedBox(width: 10),
                                Text(
                                  getButtonText(state.buttonState),
                                ),
                              ],
                            ),
                            onPressed: () {
                              startCountDown();
                            },
                          );
                        },
                      )),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextWithBorderWidget(
                      text: widget.pomodoroEntity.title,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonOptionsWidget(
                        text: "Cronômetro",
                        onPressed: () {},
                        icon: Icons.timer,
                      ),
                      ButtonOptionsWidget(
                        text: "Histórico",
                        onPressed: () {},
                        icon: Icons.history,
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () {
                    showBottomSheetAddPomodoro(
                      context: context,
                      size: size,
                      controller: widget.namePomodoroController,
                      quantityController: widget.quantityController,
                      createPomodoroBloc: widget.createPomodoroBloc,
                    );
                  },
                  backgroundColor: StudyFlowColors.secondary,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
