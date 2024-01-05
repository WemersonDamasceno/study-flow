part of 'select_tag_priority_bloc.dart';

sealed class SelectTagPriorityEvent extends Equatable {
  const SelectTagPriorityEvent();
}

class SelectTagPriority extends SelectTagPriorityEvent {
  final TagPriorityEnum tagPriority;

  const SelectTagPriority({
    required this.tagPriority,
  });

  @override
  List<Object> get props => [tagPriority];
}
