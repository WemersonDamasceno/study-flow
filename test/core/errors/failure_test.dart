import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/core/errors/failure.dart';

void main() {
  const String tMessage = 'error message';

  test('test SharedPrefFailure class', () {
    expect(SharedPrefFailure, SharedPrefFailure);
    expect(const SharedPrefFailure(message: tMessage), isA<Failure>());
    expect(const SharedPrefFailure(message: tMessage).props.isNotEmpty, true);
  });
}
