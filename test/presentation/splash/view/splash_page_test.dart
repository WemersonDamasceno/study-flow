import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';
import 'package:study_flow/presentation/splash/splash_imports.dart';

class MockGetUserInLocalStorageBloc
    extends MockBloc<GetUserInLocalStorageEvent, GetUserInLocalStorageState>
    implements GetUserInLocalStorageBloc {}

void main() {
  late Widget child;
  late GetUserInLocalStorageBloc getUserInLocalStorageBloc;

  setUp(() async {
    await getIt.reset();

    getUserInLocalStorageBloc = MockGetUserInLocalStorageBloc();
    getIt.registerFactory<GetUserInLocalStorageBloc>(
        () => getUserInLocalStorageBloc);

    child = BlocProvider<GetUserInLocalStorageBloc>(
      create: (context) => getUserInLocalStorageBloc,
      child: const MaterialApp(
        home: SplashPage(),
      ),
    );
  });
  testWidgets('SplashPage should render SplashView',
      (WidgetTester tester) async {
    //Arrange
    when(() => getUserInLocalStorageBloc.state).thenReturn(
      const GetUserInLocalStorageState(
        status: StatusEnum.initial,
      ),
    );

    // Act
    await tester.pumpWidget(child);

    // Assert
    expect(find.byType(SplashView), findsOneWidget);
  });
}
