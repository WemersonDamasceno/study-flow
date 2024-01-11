import 'package:equatable/equatable.dart';

class PomodoroEntity extends Equatable {
  final int? id;
  final int userId;
  final String title;
  final String priority;
  final int quantityRepeat;
  final int timeOfRepeat;

  const PomodoroEntity({
    this.id,
    required this.userId,
    required this.title,
    required this.priority,
    required this.quantityRepeat,
    required this.timeOfRepeat,
  });

  PomodoroEntity copyWith({
    int? id,
    String? title,
    String? priority,
    int? quantityRepeat,
    int? userId,
    int? timeOfRepeat,
  }) {
    return PomodoroEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      timeOfRepeat: timeOfRepeat ?? this.timeOfRepeat,
      priority: priority ?? this.priority,
      quantityRepeat: quantityRepeat ?? this.quantityRepeat,
    );
  }

  @override
  List<Object?> get props => [id, title, priority, quantityRepeat, userId];
}
