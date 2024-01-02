import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';

import '../../../mocks/user_mock.dart';

void main() {
  late UserEntity tUserEntity;

  setUp(() {
    tUserEntity = UserMock.entity;
  });

  test('GetUserInLocalStorageState props', () {
    const state1 = GetUserInLocalStorageState();
    const state2 = GetUserInLocalStorageState();

    expect(state1, state2);
    expect(state1.hashCode, state2.hashCode);
  });

  test('GetUserInLocalStorageState copyWith', () {
    final state = GetUserInLocalStorageState(
      status: StatusEnum.success,
      userEntity: tUserEntity,
    );

    final copiedState = state.copyWith(status: StatusEnum.loading);

    expect(copiedState.status, equals(StatusEnum.loading));
    expect(copiedState.userEntity, equals(tUserEntity));
  });

  test('GetUserInLocalStorageState copyWith no changes', () {
    final state = GetUserInLocalStorageState(
      status: StatusEnum.success,
      userEntity: tUserEntity,
    );

    final copiedState = state.copyWith();

    expect(copiedState, equals(state));
  });

  test('GetUserInLocalStorageState copyWith with changes', () {
    final state = GetUserInLocalStorageState(
      status: StatusEnum.success,
      userEntity: tUserEntity,
    );

    final copiedState = state.copyWith(
      status: StatusEnum.error,
      userEntity: tUserEntity.copyWith(id: ''),
    );

    expect(copiedState.status, equals(StatusEnum.error));
    expect(copiedState.userEntity!.id, isEmpty);
  });

  test('GetUserInLocalStorageState props', () {
    final state = GetUserInLocalStorageState(
      status: StatusEnum.success,
      userEntity: tUserEntity,
    );

    expect(state.props, isNotEmpty);
  });
}
