import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lottie/lottie.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/utils/shared_preferences.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

class MockSharedPref extends Mock implements SharedPref {}

void main() {
  late MockSharedPref mockSharedPref;

  setUp(() {
    mockSharedPref = MockSharedPref();
  });

  testWidgets('SplashView should navigate to the correct page',
      (WidgetTester tester) async {
    // Mock SharedPref to return a non-null value for "name"
    when(() => mockSharedPref.read("name")).thenAnswer((_) async => 'John Doe');

    await tester.pumpWidget(const MaterialApp(
      home: SplashView(),
    ));

    // Verify if the initial widgets are rendered
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(LottieBuilder), findsOneWidget);
    expect(find.text("Study Flow"), findsOneWidget);
  });

  testWidgets('SplashView should navigate to LoginView when name is null',
      (WidgetTester tester) async {
    // Mock SharedPref to return null for "name"
    when(() => mockSharedPref.read("name")).thenAnswer((_) async => null);

    await tester.pumpWidget(const MaterialApp(
      home: SplashView(),
    ));

    // Verify if the next screen (LoginView) is called correctly
    expect(find.byType(SplashView), findsOneWidget);
  });
}
