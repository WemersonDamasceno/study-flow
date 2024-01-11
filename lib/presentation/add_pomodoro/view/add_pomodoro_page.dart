import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/add_pomodoro/view/add_pomodoro_view.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';

class AddPomodoroPage extends StatelessWidget {
  const AddPomodoroPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectTagPriorityBloc>(
          create: (_) => getIt<SelectTagPriorityBloc>(),
        ),
        BlocProvider<CreatePomodoroBloc>(
          create: (_) => getIt<CreatePomodoroBloc>(),
        ),
      ],
      child: const AddPomodoroView(),
    );
  }
}
