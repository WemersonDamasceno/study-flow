import 'package:flutter/material.dart';
import 'package:study_flow/core/colors/study_flow_colors.dart';
import 'package:study_flow/presentation/home/controller/quantity_controller.dart';

class QuantityWidget extends StatelessWidget {
  final QuantityController controller;

  const QuantityWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasFocus = FocusScope.of(context).hasFocus;

    controller.context = context;

    if (hasFocus == false) {
      FocusScope.of(context).unfocus();
    }

    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Container(
          height: 40,
          width: 122,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: StudyFlowColors.secondary,
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 10,
                  child: GestureDetector(
                    onTap: () => controller.decrementQuantity(),
                    onLongPress: () => controller.continuousDecrement(),
                    onLongPressEnd: (_) => controller.timerCancel(),
                    child: Icon(
                      Icons.remove,
                      size: 20,
                      color: controller.quantity > 0
                          ? StudyFlowColors.secondary
                          : Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  top: -7,
                  child: SizedBox(
                    width: 33,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      enableInteractiveSelection: false,
                      controller: controller.quantityController,
                      textAlign: TextAlign.center,
                      onChanged: (value) => controller.onChange(value),
                      style: TextStyle(
                        color: controller.quantity > 0
                            ? StudyFlowColors.secondary
                            : Colors.grey,
                        fontSize: 16,
                      ),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: () => controller.incrementQuantity(),
                    onLongPress: () => controller.continuousIncrement(),
                    onLongPressEnd: (_) => controller.timerCancel(),
                    child: Icon(
                      Icons.add,
                      size: 20,
                      color: StudyFlowColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
