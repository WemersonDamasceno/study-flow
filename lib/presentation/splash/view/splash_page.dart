import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetTokenInLocalStorageBloc>(
      create: (_) => getIt<GetTokenInLocalStorageBloc>(),
      child: const SplashView(),
    );
  }
}
