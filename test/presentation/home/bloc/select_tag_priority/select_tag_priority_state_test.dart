import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';

void main() {
  group('SelectTagPriorityState', () {
    test('props are [tagSelectedEnum]', () {
      const tagSelectedEnum = TagPriorityEnum.high;
      const state = SelectTagPriorityState(tagSelectedEnum: tagSelectedEnum);

      expect(state.props, [tagSelectedEnum]);
    });

    test('two instances with the same tagSelectedEnum are equal', () {
      const tagSelectedEnum = TagPriorityEnum.high;
      const state1 = SelectTagPriorityState(tagSelectedEnum: tagSelectedEnum);
      const state2 = SelectTagPriorityState(tagSelectedEnum: tagSelectedEnum);

      expect(state1, equals(state2));
    });

    test('copyWith creates a new instance with updated values', () {
      const initialTagSelectedEnum = TagPriorityEnum.high;
      const initialState =
          SelectTagPriorityState(tagSelectedEnum: initialTagSelectedEnum);

      const updatedTagSelectedEnum = TagPriorityEnum.low;
      final updatedState =
          initialState.copyWith(tagSelectedEnum: updatedTagSelectedEnum);

      expect(updatedState.tagSelectedEnum, equals(updatedTagSelectedEnum));
      expect(
          initialState.tagSelectedEnum, isNot(equals(updatedTagSelectedEnum)));
    });

    test('copyWith creates an equal instance if no values are updated', () {
      const tagSelectedEnum = TagPriorityEnum.medium;
      const state = SelectTagPriorityState(tagSelectedEnum: tagSelectedEnum);
      final copiedState = state.copyWith();

      expect(state, equals(copiedState));
    });
  });
}
