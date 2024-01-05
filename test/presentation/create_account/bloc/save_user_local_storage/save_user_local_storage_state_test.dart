import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';

void main() {
  test('SaveUserLocalStorageState props', () {
    const state1 = SaveUserLocalStorageState();
    const state2 = SaveUserLocalStorageState();

    expect(state1, state2);
    expect(state1.hashCode, state2.hashCode);
  });

  test('SaveUserLocalStorageState copyWith', () {
    const state = SaveUserLocalStorageState(status: StatusEnum.success);

    final copiedState = state.copyWith(status: StatusEnum.loading);

    expect(copiedState.status, equals(StatusEnum.loading));
  });

  test('SaveUserLocalStorageState copyWith no changes', () {
    const state = SaveUserLocalStorageState(status: StatusEnum.success);

    final copiedState = state.copyWith();

    expect(copiedState, equals(state));
  });

  test('SaveUserLocalStorageState copyWith with changes', () {
    const state = SaveUserLocalStorageState(status: StatusEnum.success);

    final copiedState = state.copyWith(status: StatusEnum.error);

    expect(copiedState.status, equals(StatusEnum.error));
  });

  test('SaveUserLocalStorageState props', () {
    const state = SaveUserLocalStorageState(status: StatusEnum.success);

    expect(state.props, isNotEmpty);
  });
}
