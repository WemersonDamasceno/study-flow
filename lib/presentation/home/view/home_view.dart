import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/text_with_border_widget.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/mixin/home_mixin.dart';
import 'package:study_flow/presentation/home/widget/app_bar_home_widget.dart';
import 'package:study_flow/presentation/home/widget/button_options_widget.dart';
import 'package:study_flow/presentation/home/widget/head_home_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  late SelectTagPriorityBloc _selectTagPriorityBloc;
  late TextEditingController _namePomodoroController;
  late QuantityController _quantityController;
  String tagSelected = "Alta";

  @override
  void initState() {
    super.initState();

    _selectTagPriorityBloc = BlocProvider.of<SelectTagPriorityBloc>(context);
    _namePomodoroController = TextEditingController();
    _quantityController = getIt<QuantityController>();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheetAddPomodoro(
            context,
            size,
            _namePomodoroController,
            _quantityController,
            _selectTagPriorityBloc,
          );
        },
        backgroundColor: StudyFlowColors.secondary,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    const HeadHomeWidget(
                      appBarHomeWidget: AppBarHomeWidget(
                        firstNameUser: "Wemerson",
                        initialsNameUser: "WD",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ButtonMainWidget(
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.play_arrow),
                            SizedBox(width: 10),
                            Text("Iniciar Pomodoro"),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: TextWithBorderWidget(
                        text: "Estudar realidade aumentada com Flutter.",
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonOptionsWidget(
                          text: "Cronômetro",
                          onPressed: () {},
                          icon: Icons.timer,
                        ),
                        ButtonOptionsWidget(
                          text: "Histórico",
                          onPressed: () {},
                          icon: Icons.history,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
