import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/routers/study_flow_routers.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/buttons/widgets/loading_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/presentation/create_account/widgets/head_create_account_widget.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late ButtonManagerStatusBloc _buttonManagerStatusBloc;
  @override
  void initState() {
    super.initState();
    _buttonManagerStatusBloc =
        BlocProvider.of<ButtonManagerStatusBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: InputFormWidget(
                        label: 'Nome',
                        hintText: 'Digite seu nome',
                      ),
                    ),
                    BlocBuilder<ButtonManagerStatusBloc,
                        ButtonManagerStatusState>(
                      bloc: _buttonManagerStatusBloc,
                      builder: (context, state) {
                        final statusIsLoading =
                            state.status == StatusEnum.loading;
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: ButtonMainWidget(
                            onPressed: () async {
                              _buttonManagerStatusBloc.add(
                                const ButtonManagerStatus(
                                  status: StatusEnum.loading,
                                ),
                              );
                              await Future.delayed(
                                const Duration(seconds: 2),
                                () {
                                  Navigator.popAndPushNamed(
                                    context,
                                    StudyFlowRouters.splash,
                                  );
                                },
                              );
                            },
                            child: Visibility(
                                visible: statusIsLoading,
                                replacement: const Text('Criar Conta'),
                                child: const LoadingWidget()),
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
    );
  }
}
