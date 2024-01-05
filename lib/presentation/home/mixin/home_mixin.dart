import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';
import 'package:study_flow/presentation/home/widget/quantity_widget.dart';
import 'package:study_flow/presentation/home/widget/tag_priority_widget.dart';

mixin HomeMixin {
  void showBottomSheetAddPomodoro(
    BuildContext context,
    Size size,
    TextEditingController controller,
    QuantityController quantityController,
    SelectTagPriorityBloc selectTagPriorityBloc,
  ) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        TagPriorityEnum tagPriorityEnum = TagPriorityEnum.high;

        return SizedBox(
          height: size.height * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
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
                  controller: controller,
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
                  controller: quantityController,
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
                  bloc: selectTagPriorityBloc,
                  builder: (context, state) {
                    final tagSelected = state.tagSelectedEnum;
                    tagPriorityEnum = tagSelected;
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            selectTagPriorityBloc.add(
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
                            selectTagPriorityBloc.add(
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
                            selectTagPriorityBloc.add(
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
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save),
                      SizedBox(width: 10),
                      Text("Adicionar Pomodoro"),
                    ],
                  ),
                  onPressed: () {
                    log("tagPriorityEnum $tagPriorityEnum");
                  },
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
            ),
          ),
        );
      },
    );
  }
}
