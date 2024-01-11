import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/presentation/home/bloc/create_pomodoro/create_pomodoro_bloc.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/widget/quantity_widget.dart';
import 'package:study_flow/presentation/home/widget/tag_priority_widget.dart';

class BottomSheetWidget extends StatefulWidget {
  final TextEditingController titleController;
  final QuantityController quantityController;
  final CreatePomodoroBloc createPomodoroBloc;

  const BottomSheetWidget({
    Key? key,
    required this.titleController,
    required this.quantityController,
    required this.createPomodoroBloc,
  }) : super(key: key);

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  late TagPriorityEnum tagPriorityEnum;
  late SelectTagPriorityBloc _selectTagPriorityBloc;
  late Session _session;

  @override
  void initState() {
    super.initState();

    tagPriorityEnum = TagPriorityEnum.high;
    _session = getIt<Session>();
    _selectTagPriorityBloc = BlocProvider.of<SelectTagPriorityBloc>(context);
  }

  void resetValues() {
    widget.titleController.clear();
    widget.quantityController.resetValues();
    _selectTagPriorityBloc.add(
      const SelectTagPriority(
        tagPriority: TagPriorityEnum.high,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            "Adicionar Pomodoro",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        InputFormWidget(
          label: "Nome do Pomodoro",
          hintText: "Ex: Estudar Flutter",
          controller: widget.titleController,
        ),
        const SizedBox(height: 20),
        Text(
          "Quantidade de repetições",
          style: TextStyle(
            color: StudyFlowColors.secondary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        QuantityWidget(
          controller: widget.quantityController,
        ),
        const SizedBox(height: 20),
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
            tagPriorityEnum = tagSelected;
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
                const SizedBox(width: 20),
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
                    isSelected: tagSelected == TagPriorityEnum.medium,
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
        const SizedBox(height: 20),
        ButtonMainWidget(
          onPressed: () {
            widget.createPomodoroBloc.add(
              CreatePomodoro(
                pomodoroEntity: PomodoroEntity(
                  userId: _session.userEntity?.id ?? 1,
                  title: widget.titleController.text,
                  timeOfRepeat: 0,
                  quantityRepeat: widget.quantityController.quantity,
                  priority: tagPriorityEnum.label,
                ),
              ),
            );

            resetValues();
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
        const SizedBox(height: 20),
        ButtonMainWidget(
          backgroundColor: Colors.white,
          textColor: StudyFlowColors.secondary,
          borderColor: StudyFlowColors.secondary,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.close),
              SizedBox(width: 10),
              Text("Cancelar"),
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
