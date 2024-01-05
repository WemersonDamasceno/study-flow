import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';
import 'package:study_flow/presentation/create_account/view/create_accout_view.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ButtonManagerStatusBloc>(),
        ),
        BlocProvider<SaveTokenBloc>(
          create: (_) => getIt<SaveTokenBloc>(),
        ),
        BlocProvider<SaveUserLocalStorageBloc>(
          create: (_) => getIt<SaveUserLocalStorageBloc>(),
        ),
      ],
      child: const CreateAccountView(),
    );
  }
}
