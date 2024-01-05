import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/buttons/widgets/loading_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';
import 'package:study_flow/presentation/create_account/widgets/bloc_listeners_create_account_widget.dart';
import 'package:study_flow/presentation/create_account/widgets/head_create_account_widget.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late SaveUserLocalStorageBloc _saveUserLocalStorageBloc;
  late ButtonManagerStatusBloc _buttonManagerStatusBloc;
  late SaveTokenBloc _saveTokenBloc;
  late Session _session;

  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _session = getIt<Session>();
    _nameController = TextEditingController();
    _saveTokenBloc = BlocProvider.of<SaveTokenBloc>(context);
    _buttonManagerStatusBloc = BlocProvider.of<ButtonManagerStatusBloc>(
      context,
    );
    _saveUserLocalStorageBloc = BlocProvider.of<SaveUserLocalStorageBloc>(
      context,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocListenersCreateAccountWidget(
        session: _session,
        saveTokenBloc: _saveTokenBloc,
        userName: _nameController.text,
        saveUserLocalStorageBloc: _saveUserLocalStorageBloc,
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      const HeadCreateAccountWidget(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: InputFormWidget(
                          label: 'Nome e sobrenome',
                          hintText: 'Ex: Wemerson Damasceno',
                          controller: _nameController,
                        ),
                      ),
                      BlocBuilder<ButtonManagerStatusBloc,
                          ButtonManagerStatusState>(
                        bloc: _buttonManagerStatusBloc,
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: ButtonMainWidget(
                              onPressed: () => onPressedButtonCreateAccout(),
                              child: Visibility(
                                visible: state.status == StatusEnum.loading,
                                replacement: const Text('Criar Conta'),
                                child: const LoadingWidget(),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 50,
                    child: Column(
                      children: [
                        Text(
                          'StudyFlow',
                          style: TextStyle(
                            color: StudyFlowColors.secondary,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'WID4 Software',
                          style: TextStyle(
                            color: StudyFlowColors.secondary.withOpacity(0.9),
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPressedButtonCreateAccout() async {
    //Start loading button
    _buttonManagerStatusBloc.add(
      const ButtonManagerStatus(
        status: StatusEnum.loading,
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    //Save user in local storage
    _saveUserLocalStorageBloc.add(
      SaveUserLocalStorage(
        userEntity: UserEntity(
          nameUser: _nameController.text,
        ),
      ),
    );
  }
}
