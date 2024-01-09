import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_token/get_token_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_user/get_user_bloc.dart';
import 'package:study_flow/presentation/home/mixin/home_mixin.dart';

class BlocListenersHomeWidget extends StatelessWidget with HomeMixin {
  final Widget child;
  final CreatePomodoroBloc createPomodoroBloc;
  final GetAllPomodoroBloc getAllPomodoroBloc;
  final GetTokenBloc getTokenBloc;
  final GetUserBloc getUserBloc;
  final Session session;

  const BlocListenersHomeWidget({
    Key? key,
    required this.child,
    required this.createPomodoroBloc,
    required this.getAllPomodoroBloc,
    required this.getTokenBloc,
    required this.getUserBloc,
    required this.session,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<GetTokenBloc, GetTokenState>(
          bloc: getTokenBloc,
          listener: (context, state) {
            if (state.status == StatusEnum.success) {
              getUserBloc.add(GetUser(idUser: state.token!));
            }

            if (state.status == StatusEnum.error ||
                state.status == StatusEnum.empty) {
              Navigator.popAndPushNamed(
                context,
                StudyFlowRouters.createAccount,
              );
            }
          },
        ),
        BlocListener<GetUserBloc, GetUserState>(
          bloc: getUserBloc,
          listener: (context, state) {
            if (state.status == StatusEnum.success) {
              session.userEntity = state.userEntity;

              getAllPomodoroBloc.add(
                GetAllPomodoro(userId: state.userEntity!.id.toString()),
              );
            }
          },
        ),
        BlocListener<CreatePomodoroBloc, CreatePomodoroState>(
          bloc: createPomodoroBloc,
          listener: (context, state) {
            if (state.status == StatusEnum.success) {
              Navigator.pop(context);
              showSnackbarWithMessageSuccess(context);
              getAllPomodoroBloc.add(
                GetAllPomodoro(userId: session.userEntity!.id.toString()),
              );
            }

            if (state.status == StatusEnum.error) {
              Navigator.pop(context);
              showSnackbarWithMessageError(context);
            }
          },
        ),
      ],
      child: child,
    );
  }
}
