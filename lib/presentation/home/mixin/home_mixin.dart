import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/widget/bottom_sheet_widget.dart';

mixin HomeMixin {
  void showBottomSheetAddPomodoro({
    required BuildContext context,
    required Size size,
    required TextEditingController controller,
    required QuantityController quantityController,
    required CreatePomodoroBloc createPomodoroBloc,
  }) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SelectTagPriorityBloc>(
              create: (_) => getIt<SelectTagPriorityBloc>(),
            ),
          ],
          child: SizedBox(
            height: size.height * 0.75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomSheetWidget(
                titleController: controller,
                quantityController: quantityController,
                createPomodoroBloc: createPomodoroBloc,
              ),
            ),
          ),
        );
      },
    );
  }

  String getButtonText(ButtonState buttonState) {
    switch (buttonState) {
      case ButtonState.init:
        return "Iniciar Pomodoro";
      case ButtonState.pause:
        return "Pausar Pomodoro";
      case ButtonState.resume:
        return "Continuar Pomodoro";
      case ButtonState.initBreak:
        return "Iniciar Descanso";
      case ButtonState.pauseBreak:
        return "Pausar Descanso";
      case ButtonState.resumeBreak:
        return "Continuar Descanso";
      default:
        return "";
    }
  }

  String formatedTime(int time) {
    return "${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}";
  }

  double calcularPorcentagem(double valorA, double valorB) {
    return (valorB / valorA);
  }

  double convertSecondsInMinutes(int seconds) {
    return (seconds * 60);
  }
}
