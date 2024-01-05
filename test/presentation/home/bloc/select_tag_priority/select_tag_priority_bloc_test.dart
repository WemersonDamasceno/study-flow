import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/tags_priority_enum.dart';
import 'package:study_flow/presentation/home/bloc/select_tag_priority/select_tag_priority_bloc.dart';

void main() {
  group('SelectTagPriorityBloc', () {
    late SelectTagPriorityBloc selectTagPriorityBloc;

    setUp(() {
      selectTagPriorityBloc = SelectTagPriorityBloc();
    });

    tearDown(() {
      selectTagPriorityBloc.close();
    });

    test('initial state is SelectTagPriorityState', () {
      expect(selectTagPriorityBloc.state, isA<SelectTagPriorityState>());
    });

    blocTest<SelectTagPriorityBloc, SelectTagPriorityState>(
      'emits [SelectTagPriorityState] when SelectTagPriority event is added',
      build: () => selectTagPriorityBloc,
      act: (bloc) => bloc.add(
        const SelectTagPriority(tagPriority: TagPriorityEnum.high),
      ),
      expect: () => [
        const SelectTagPriorityState(tagSelectedEnum: TagPriorityEnum.high),
      ],
    );
  });
}
