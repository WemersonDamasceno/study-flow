import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/presentation/splash/bloc/get_token_in_local_storage_bloc.dart';

void main() {
  late String tokenUser;

  setUp(() {
    tokenUser = "A3X-42G-M1NDTR1X-789";
  });

  test('GetUserInLocalStorageState props', () {
    const state1 = GetTokenInLocalStorageState();
    const state2 = GetTokenInLocalStorageState();

    expect(state1, state2);
    expect(state1.hashCode, state2.hashCode);
  });

  test('GetUserInLocalStorageState copyWith', () {
    final state = GetTokenInLocalStorageState(
      status: StatusEnum.success,
      token: tokenUser,
    );

    final copiedState = state.copyWith(status: StatusEnum.loading);

    expect(copiedState.status, equals(StatusEnum.loading));
    expect(copiedState.token, equals(tokenUser));
  });

  test('GetUserInLocalStorageState copyWith no changes', () {
    final state = GetTokenInLocalStorageState(
      status: StatusEnum.success,
      token: tokenUser,
    );

    final copiedState = state.copyWith();

    expect(copiedState, equals(state));
  });

  test('GetUserInLocalStorageState copyWith with changes', () {
    final state = GetTokenInLocalStorageState(
      status: StatusEnum.success,
      token: tokenUser,
    );

    final copiedState = state.copyWith(
      status: StatusEnum.error,
      token: "123",
    );

    expect(copiedState.status, equals(StatusEnum.error));
    expect(copiedState.token, "123");
  });

  test('GetUserInLocalStorageState props', () {
    final state = GetTokenInLocalStorageState(
      status: StatusEnum.success,
      token: tokenUser,
    );

    expect(state.props, isNotEmpty);
  });
}
