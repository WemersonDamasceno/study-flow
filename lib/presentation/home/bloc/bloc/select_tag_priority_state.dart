part of 'select_tag_priority_bloc.dart';

class SelectTagPriorityState extends Equatable {
  final TagPriorityEnum tagSelectedEnum;

  const SelectTagPriorityState({
    this.tagSelectedEnum = TagPriorityEnum.high,
  });

  @override
  List<Object> get props => [tagSelectedEnum];

  SelectTagPriorityState copyWith({
    TagPriorityEnum? tagSelectedEnum,
  }) {
    return SelectTagPriorityState(
      tagSelectedEnum: tagSelectedEnum ?? this.tagSelectedEnum,
    );
  }
}
