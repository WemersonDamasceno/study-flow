import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/data/datasources/shared_preferences/shared_preferences_datasource.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

class MockSharedPref extends Mock implements SharedPrefDatasourceImpl {}

class MockGetUserInLocalStorageBloc
    extends MockBloc<GetUserInLocalStorageEvent, GetUserInLocalStorageState>
    implements GetUserInLocalStorageBloc {}

void main() {
  late MockSharedPref mockSharedPref;

  late Widget child;
  late GetUserInLocalStorageBloc getUserInLocalStorageBloc;

  setUp(() async {
    await getIt.reset();

    getUserInLocalStorageBloc = MockGetUserInLocalStorageBloc();
    mockSharedPref = MockSharedPref();

    getIt.registerFactory<GetUserInLocalStorageBloc>(
        () => getUserInLocalStorageBloc);

    child = BlocProvider<GetUserInLocalStorageBloc>(
      create: (context) => getUserInLocalStorageBloc,
      child: const MaterialApp(
        home: SplashView(),
      ),
    );
  });

  testWidgets('SplashView should show to the SUCCESS screen',
      (WidgetTester tester) async {
    //Arrange
    when(() => mockSharedPref.read("name")).thenAnswer((_) async => 'John Doe');
    when(() => getUserInLocalStorageBloc.state).thenReturn(
      const GetUserInLocalStorageState(
        status: StatusEnum.success,
      ),
    );

    // Act
    await tester.pumpWidget(child);

    // Assert
    expect(find.text("Study Flow"), findsOneWidget);
    expect(
      find.byKey(const ValueKey("success_screen_widget")),
      findsOneWidget,
    );
  });

  testWidgets('SplashView should show to the ERROR screen',
      (WidgetTester tester) async {
    //Arrange
    when(() => mockSharedPref.read("name")).thenAnswer((_) async => 'John Doe');
    when(() => getUserInLocalStorageBloc.state).thenReturn(
      const GetUserInLocalStorageState(
        status: StatusEnum.error,
      ),
    );

    // Act
    await tester.pumpWidget(child);

    // Assert
    expect(
      find.byKey(const ValueKey("error_screen_widget")),
      findsOneWidget,
    );
  });

  testWidgets('SplashView should navigate to LoginView when name is null',
      (WidgetTester tester) async {
    // Arrange
    when(() => mockSharedPref.read("name")).thenAnswer((_) async => null);
    when(() => getUserInLocalStorageBloc.state).thenReturn(
      const GetUserInLocalStorageState(
        status: StatusEnum.empty,
      ),
    );

    // Act
    await tester.pumpWidget(child);

    // Assert
    expect(find.byType(SplashView), findsOneWidget); //Alterar para login
  });
}
