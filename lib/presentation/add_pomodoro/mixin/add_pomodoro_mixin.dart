import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/widgets/snackbar_widget.dart';

mixin AddPomodoroMixin {
  showSnackbarWithMessageSuccess(BuildContext context) {
    return SnackBarWidget(
      context: context,
      snackbarIcon: Icons.check_circle,
      labelSnackbar: "A atividade foi adicionada!",
      labelButton: "Fechar",
      snackbarBackgroundColor: StudyFlowColors.successPure,
      snackbarFontColor: Colors.white,
      buttonBackgroundColor: StudyFlowColors.successLight,
      buttonFontColor: Colors.white,
      buttonCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ).show();
  }

  showSnackbarWithMessageError(BuildContext context) {
    return SnackBarWidget(
      context: context,
      snackbarIcon: Icons.error,
      labelSnackbar: "Ops! Ocorreu um erro.",
      labelButton: "Fechar",
      snackbarBackgroundColor: StudyFlowColors.errorPure,
      snackbarFontColor: Colors.white,
      buttonBackgroundColor: StudyFlowColors.errorLight,
      buttonFontColor: Colors.white,
      buttonCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ).show();
  }
}
