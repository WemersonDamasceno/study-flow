import 'package:equatable/equatable.dart';

class PomodoroEntity extends Equatable {
  final int? id;
  final int userId;
  final String title;
  final String priority;
  final int quantityRepeat;

  const PomodoroEntity({
    this.id,
    required this.userId,
    required this.title,
    required this.priority,
    required this.quantityRepeat,
  });

  PomodoroEntity copyWith({
    int? id,
    String? title,
    String? priority,
    int? quantityRepeat,
    int? userId,
  }) {
    return PomodoroEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      quantityRepeat: quantityRepeat ?? this.quantityRepeat,
    );
  }

  @override
  List<Object?> get props => [id, title, priority, quantityRepeat, userId];
}
