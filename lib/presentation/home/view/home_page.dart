import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SelectTagPriorityBloc>(),
      child: const HomeView(),
    );
  }
}
