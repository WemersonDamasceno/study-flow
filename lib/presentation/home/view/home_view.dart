import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart';
import 'package:study_flow/presentation/home/bloc/change_value_timer/change_value_timer_bloc.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_all_pomodoro/get_all_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_token/get_token_bloc.dart';
import 'package:study_flow/presentation/home/bloc/get_user/get_user_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/mixin/home_mixin.dart';
import 'package:study_flow/presentation/home/widget/bloc_listeners_home_widget.dart';
import 'package:study_flow/presentation/home/widget/screens/home_empty_widget.dart';
import 'package:study_flow/presentation/home/widget/screens/home_success_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  late TextEditingController _namePomodoroController;
  late QuantityController _quantityController;

  late ChangeValueTimerBloc _changeValueTimerBloc;
  late CreatePomodoroBloc _createPomodoroBloc;
  late GetAllPomodoroBloc _getAllPomodoroBloc;
  late GetUserBloc _getUserBloc;
  late GetTokenBloc _getTokenBloc;
  late ManagerButtonMainBloc _managerButtonMainBloc;

  late Session _session;

  @override
  void initState() {
    super.initState();

    _namePomodoroController = TextEditingController();
    _quantityController = getIt<QuantityController>();
    _session = getIt<Session>();

    _managerButtonMainBloc = BlocProvider.of<ManagerButtonMainBloc>(context);
    _changeValueTimerBloc = BlocProvider.of<ChangeValueTimerBloc>(context);
    _createPomodoroBloc = BlocProvider.of<CreatePomodoroBloc>(context);
    _getAllPomodoroBloc = BlocProvider.of<GetAllPomodoroBloc>(context);
    _getTokenBloc = BlocProvider.of<GetTokenBloc>(context);
    _getUserBloc = BlocProvider.of<GetUserBloc>(context);

    if (_session.userEntity == null) {
      _getTokenBloc.add(const GetToken());
    } else {
      _getAllPomodoroBloc.add(
        GetAllPomodoro(userId: _session.userEntity!.id.toString()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListenersHomeWidget(
        createPomodoroBloc: _createPomodoroBloc,
        getAllPomodoroBloc: _getAllPomodoroBloc,
        getTokenBloc: _getTokenBloc,
        getUserBloc: _getUserBloc,
        session: _session,
        child: BlocBuilder<GetAllPomodoroBloc, GetAllPomodoroState>(
          bloc: _getAllPomodoroBloc,
          builder: (context, state) {
            if (state.status == StatusEnum.error) {
              return const Center(
                child: Text("Erro ao carregar os dados."),
              );
            }

            if (state.status == StatusEnum.empty) {
              return HomeEmptyWidget(
                changeValueTimerBloc: _changeValueTimerBloc,
                createPomodoroBloc: _createPomodoroBloc,
                namePomodoroController: _namePomodoroController,
                quantityController: _quantityController,
                session: _session,
              );
            }

            if (state.status == StatusEnum.success) {
              return HomeSuccessWidget(
                namePomodoroController: _namePomodoroController,
                managerButtonMainBloc: _managerButtonMainBloc,
                changeValueTimerBloc: _changeValueTimerBloc,
                createPomodoroBloc: _createPomodoroBloc,
                quantityController: _quantityController,
                pomodoroEntity: state.pomodoros!.first,
                session: _session,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
