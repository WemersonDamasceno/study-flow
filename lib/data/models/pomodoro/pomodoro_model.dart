import 'package:study_flow/domain/entities/pomodoro_entity.dart';

class PomodoroModel extends PomodoroEntity {
  const PomodoroModel({
    int? id,
    required String title,
    required String priority,
    required int quantityRepeat,
    required int userId,
  }) : super(
          id: id,
          userId: userId,
          title: title,
          priority: priority,
          quantityRepeat: quantityRepeat,
        );

  factory PomodoroModel.fromJson(Map<String, dynamic> json) {
    return PomodoroModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'] as String,
      priority: json['priority'] as String,
      quantityRepeat: json['quantity_repeat'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'priority': priority,
      'quantity_repeat': quantityRepeat,
    };
  }

  factory PomodoroModel.fromEntity(PomodoroEntity entity) {
    return PomodoroModel(
      id: entity.id,
      userId: entity.userId,
      title: entity.title,
      priority: entity.priority,
      quantityRepeat: entity.quantityRepeat,
    );
  }

  copy({
    int? id,
    String? title,
    String? priority,
    int? quantityRepeat,
    int? userId,
  }) {
    return PomodoroModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      quantityRepeat: quantityRepeat ?? this.quantityRepeat,
    );
  }
}
