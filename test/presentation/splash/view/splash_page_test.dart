import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

void main() {
  testWidgets('SplashPage should render SplashView',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: SplashPage(),
    ));

    // Verify that SplashView is rendered.
    expect(find.byType(SplashView), findsOneWidget);
  });
}
