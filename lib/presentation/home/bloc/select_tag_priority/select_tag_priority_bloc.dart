import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';

part 'select_tag_priority_event.dart';
part 'select_tag_priority_state.dart';

@injectable
class SelectTagPriorityBloc
    extends Bloc<SelectTagPriorityEvent, SelectTagPriorityState> {
  SelectTagPriorityBloc() : super(const SelectTagPriorityState()) {
    on<SelectTagPriority>(_selectTagPriority);
  }

  void _selectTagPriority(
    SelectTagPriority event,
    Emitter<SelectTagPriorityState> emit,
  ) {
    emit(state.copyWith(tagSelectedEnum: event.tagPriority));
  }
}
