import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:study_flow/presentation/create_account/view/create_accout_view.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ButtonManagerStatusBloc(),
        ),
      ],
      child: const CreateAccountView(),
    );
  }
}
