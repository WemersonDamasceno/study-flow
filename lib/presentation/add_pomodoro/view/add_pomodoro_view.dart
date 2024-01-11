import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/core/widgets/snackbar_widget.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/presentation/add_pomodoro/mixin/add_pomodoro_mixin.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/widget/quantity_widget.dart';
import 'package:study_flow/presentation/home/widget/tag_priority_widget.dart';

class AddPomodoroView extends StatefulWidget {
  const AddPomodoroView({Key? key}) : super(key: key);

  @override
  State<AddPomodoroView> createState() => _AddPomodoroViewState();
}

class _AddPomodoroViewState extends State<AddPomodoroView>
    with AddPomodoroMixin {
  late TextEditingController _titleController;
  late QuantityController _quantityController;
  late TagPriorityEnum _tagPriorityEnum;
  late SelectTagPriorityBloc _selectTagPriorityBloc;
  late CreatePomodoroBloc _createPomodoroBloc;
  late Session _session;
  double timeOfRepeat = 25;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _tagPriorityEnum = TagPriorityEnum.high;

    _session = getIt<Session>();
    _quantityController = getIt<QuantityController>();

    _createPomodoroBloc = BlocProvider.of<CreatePomodoroBloc>(context);
    _selectTagPriorityBloc = BlocProvider.of<SelectTagPriorityBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, [false]);
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Adicionar pomodoro',
              style: TextStyle(
                color: StudyFlowColors.secondary,
              ),
            ),
          ),
          body: BlocListener<CreatePomodoroBloc, CreatePomodoroState>(
            bloc: _createPomodoroBloc,
            listener: (context, state) {
              if (state.status == StatusEnum.success) {
                showSnackbarWithMessageSuccess(context);
                return Navigator.pop(context, [true]);
              }

              if (state.status == StatusEnum.error) {
                showSnackbarWithMessageError(context);
                return Navigator.pop(context, [false]);
              }
            },
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputFormWidget(
                      label: "Nome do Pomodoro",
                      hintText: "Ex: Estudar Flutter",
                      controller: _titleController,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Quantidade de repetições",
                      style: TextStyle(
                        color: StudyFlowColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    QuantityWidget(
                      controller: _quantityController,
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Prioridade da atividade",
                      style: TextStyle(
                        color: StudyFlowColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    BlocBuilder<SelectTagPriorityBloc, SelectTagPriorityState>(
                      bloc: _selectTagPriorityBloc,
                      builder: (context, state) {
                        final tagSelected = state.tagSelectedEnum;
                        _tagPriorityEnum = tagSelected;
                        return Row(
                          children: [
                            InkWell(
                              onTap: () {
                                _selectTagPriorityBloc.add(
                                  const SelectTagPriority(
                                    tagPriority: TagPriorityEnum.high,
                                  ),
                                );
                              },
                              child: TagPriorityWidget(
                                label: TagPriorityEnum.high.label,
                                color: StudyFlowColors.highPriority,
                                isSelected: tagSelected == TagPriorityEnum.high,
                              ),
                            ),
                            const SizedBox(width: 25),
                            InkWell(
                              onTap: () {
                                _selectTagPriorityBloc.add(
                                  const SelectTagPriority(
                                    tagPriority: TagPriorityEnum.medium,
                                  ),
                                );
                              },
                              child: TagPriorityWidget(
                                label: TagPriorityEnum.medium.label,
                                color: StudyFlowColors.mediumPriority,
                                isSelected:
                                    tagSelected == TagPriorityEnum.medium,
                              ),
                            ),
                            const SizedBox(width: 20),
                            InkWell(
                              onTap: () {
                                _selectTagPriorityBloc.add(
                                  const SelectTagPriority(
                                    tagPriority: TagPriorityEnum.low,
                                  ),
                                );
                              },
                              child: TagPriorityWidget(
                                label: TagPriorityEnum.low.label,
                                color: StudyFlowColors.lowPriority,
                                isSelected: tagSelected == TagPriorityEnum.low,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 25),
                    Text(
                      "Tempo de cada repetição",
                      style: TextStyle(
                        color: StudyFlowColors.secondary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: StudyFlowColors.primary,
                        thumbColor: StudyFlowColors.primary,
                        inactiveTrackColor: StudyFlowColors.secondary,
                        showValueIndicator: ShowValueIndicator.always,
                        valueIndicatorColor: StudyFlowColors.primary,
                        valueIndicatorTextStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      child: Slider(
                        value: timeOfRepeat,
                        min: 1,
                        max: 30,
                        label: timeOfRepeat.round().toString(),
                        divisions: 30,
                        onChanged: (double value) {
                          setState(() {
                            timeOfRepeat = value;
                          });
                        },
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("1 min"), Text("30 min")],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
          bottomSheet: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: ButtonMainWidget(
              onPressed: () {
                verifyFields();
              },
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  SizedBox(width: 10),
                  Text("Adicionar Pomodoro"),
                ],
              ),
            ),
          )),
    );
  }

  verifyFields() {
    if (_titleController.text.isEmpty) {
      showSnackbarWithMessageError(context);
      return;
    }
    _createPomodoroBloc.add(
      CreatePomodoro(
        pomodoroEntity: PomodoroEntity(
          userId: _session.userEntity?.id ?? 1,
          title: _titleController.text,
          quantityRepeat: _quantityController.quantity,
          priority: _tagPriorityEnum.label,
          timeOfRepeat: timeOfRepeat.toInt(),
        ),
      ),
    );
  }

  @override
  showSnackbarWithMessageError(BuildContext context) {
    return SnackBarWidget(
      context: context,
      snackbarIcon: Icons.error,
      labelSnackbar: "Preencha o campo nome!",
      labelButton: "Fechar",
      snackbarBackgroundColor: StudyFlowColors.errorPure,
      snackbarFontColor: Colors.white,
      buttonBackgroundColor: StudyFlowColors.errorLight,
      buttonFontColor: Colors.white,
      buttonCallback: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ).show();
  }
}
