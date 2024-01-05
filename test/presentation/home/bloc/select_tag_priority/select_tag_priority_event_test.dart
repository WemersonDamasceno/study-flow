import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';

void main() {
  group('SelectTagPriorityEvent', () {
    test('isA<SelectTagPriorityEvent>', () {
      const tagPriority = TagPriorityEnum.high;
      const event = SelectTagPriority(tagPriority: tagPriority);

      expect(event, isA<SelectTagPriorityEvent>());
    });

    test('props are [tagPriority]', () {
      const tagPriority = TagPriorityEnum.high;
      const event = SelectTagPriority(tagPriority: tagPriority);

      expect(event.props, [tagPriority]);
    });

    test('two instances with the same tagPriority are equal', () {
      const tagPriority = TagPriorityEnum.high;
      const event1 = SelectTagPriority(tagPriority: tagPriority);
      const event2 = SelectTagPriority(tagPriority: tagPriority);

      expect(event1, equals(event2));
    });
  });
}
