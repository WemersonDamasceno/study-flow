import 'package:flutter/material.dart';

enum TagPriorityEnum {
  low(label: "Baixa", color: Colors.green),
  medium(label: "Média", color: Colors.yellow),
  high(label: "Alta", color: Colors.red);

  final String label;
  final Color color;

  const TagPriorityEnum({
    required this.label,
    required this.color,
  });
}
