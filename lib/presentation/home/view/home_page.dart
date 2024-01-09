import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_token/get_token_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_user/get_user_bloc.dart';
import 'package:study_flow/presentation/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreatePomodoroBloc>(
          create: (_) => getIt<CreatePomodoroBloc>(),
        ),
        BlocProvider<GetAllPomodoroBloc>(
          create: (context) => getIt<GetAllPomodoroBloc>(),
        ),
        BlocProvider<GetUserBloc>(
          create: (context) => getIt<GetUserBloc>(),
        ),
        BlocProvider<GetTokenBloc>(
          create: (context) => getIt<GetTokenBloc>(),
        ),
        BlocProvider<ChangeValueTimerBloc>(
          create: (context) => getIt<ChangeValueTimerBloc>(),
        ),
        BlocProvider<ManagerButtonMainBloc>(
          create: (context) => getIt<ManagerButtonMainBloc>(),
        ),
      ],
      child: const HomeView(),
    );
  }
}
