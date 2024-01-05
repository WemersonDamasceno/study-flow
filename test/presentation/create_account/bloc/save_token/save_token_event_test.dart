import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';

void main() {
  const token = 'test_token';
  test('SaveTokenEvent props', () {
    const event1 = SaveToken(token: token);
    const event2 = SaveToken(token: token);

    expect(event1, event2);
    expect(event1.hashCode, event2.hashCode);
  });

  test('SaveTokenEvent props with different key', () {
    const event1 = SaveToken(token: 'test_key_1');
    const event2 = SaveToken(token: 'test_key_2');

    expect(event1, isNot(event2));
  });

  test('SaveToken extends SaveTokenEvent', () {
    const SaveTokenEvent event = SaveToken(
      token: token,
    );

    expect(event, isA<SaveTokenEvent>());
  });

  test('SaveToken props', () {
    const event = SaveToken(token: token);
    expect(event.props, isNotEmpty);
  });
}
