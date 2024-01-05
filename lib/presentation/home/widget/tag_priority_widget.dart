import 'package:flutter/material.dart';

class TagPriorityWidget extends StatelessWidget {
  const TagPriorityWidget({
    Key? key,
    required this.color,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  final Color color;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
        border: isSelected
            ? Border.all(
                color: Colors.black,
                width: 5,
              )
            : null,
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
