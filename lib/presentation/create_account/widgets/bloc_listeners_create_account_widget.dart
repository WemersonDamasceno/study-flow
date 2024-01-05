import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/utils/generate_token.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';

class BlocListenersCreateAccountWidget extends StatelessWidget {
  final Widget child;
  final String userName;
  final Session session;
  final SaveTokenBloc saveTokenBloc;
  final SaveUserLocalStorageBloc saveUserLocalStorageBloc;

  const BlocListenersCreateAccountWidget({
    Key? key,
    required this.child,
    required this.session,
    required this.userName,
    required this.saveTokenBloc,
    required this.saveUserLocalStorageBloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SaveUserLocalStorageBloc, SaveUserLocalStorageState>(
          bloc: saveUserLocalStorageBloc,
          listener: (context, state) {
            if (state.status == StatusEnum.success) {
              //Save user in session
              session.userEntity = state.userEntity;

              //Generate token
              saveTokenBloc.add(SaveToken(
                token: generateToken(userName),
              ));
            }
          },
        ),
        BlocListener<SaveTokenBloc, SaveTokenState>(
          bloc: saveTokenBloc,
          listener: (context, state) {
            if (state.status == StatusEnum.success) {
              Navigator.popAndPushNamed(
                context,
                StudyFlowRouters.home,
              );
            }
          },
        ),
      ],
      child: child,
    );
  }
}
