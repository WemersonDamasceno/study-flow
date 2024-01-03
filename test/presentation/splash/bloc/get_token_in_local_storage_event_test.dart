import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';

void main() {
  test('GetUserInLocalStorageEvent props', () {
    const event1 = GetUserInLocalStorage(key: 'test_key');
    const event2 = GetUserInLocalStorage(key: 'test_key');

    expect(event1, event2);
    expect(event1.hashCode, event2.hashCode);
  });

  test('GetUserInLocalStorageEvent props with different key', () {
    const event1 = GetUserInLocalStorage(key: 'test_key_1');
    const event2 = GetUserInLocalStorage(key: 'test_key_2');

    expect(event1, isNot(event2));
  });

  test('GetUserInLocalStorage extends GetUserInLocalStorageEvent', () {
    const GetTokenInLocalStorageEvent event = GetUserInLocalStorage(
      key: 'test_key',
    );

    expect(event, isA<GetTokenInLocalStorageEvent>());
  });

  test('GetUserInLocalStorageEvent props', () {
    const event = GetUserInLocalStorage(key: 'test_key');
    expect(event.props, isNotEmpty);
  });
}
