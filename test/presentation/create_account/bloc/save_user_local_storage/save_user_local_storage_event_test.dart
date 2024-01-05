import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';

import '../../../../mocks/user_mock.dart';

void main() {
  final user = UserMock.entity;
  test('SaveUserLocalStorageEvent props', () {
    final event1 = SaveUserLocalStorage(userEntity: user);
    final event2 = SaveUserLocalStorage(userEntity: user);

    expect(event1, event2);
    expect(event1.hashCode, event2.hashCode);
  });

  test('SaveUserLocalStorageEvent props with different key', () {
    final event1 = SaveUserLocalStorage(userEntity: user);
    final event2 = SaveUserLocalStorage(userEntity: user.copyWith(id: '23'));

    expect(event1, isNot(event2));
  });

  test('SaveUserLocalStorage extends SaveUserLocalStorageEvent', () {
    final SaveUserLocalStorageEvent event = SaveUserLocalStorage(
      userEntity: user,
    );

    expect(event, isA<SaveUserLocalStorageEvent>());
  });

  test('SaveUserLocalStorage props', () {
    final event = SaveUserLocalStorage(userEntity: user);
    expect(event.props, isNotEmpty);
  });
}
