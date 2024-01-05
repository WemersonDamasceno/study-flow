import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/session/session.dart';
import 'package:study_flow/core/widgets/buttons/button_manager_status/button_manager_status_bloc.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';
import 'package:study_flow/core/widgets/input_form_widget.dart';
import 'package:study_flow/di/di.dart';
import 'package:study_flow/presentation/create_account/bloc/save_token/save_token_bloc.dart';
import 'package:study_flow/presentation/create_account/bloc/save_user_local_storage/save_user_local_storage_bloc.dart';
import 'package:study_flow/presentation/create_account/view/create_account_page.dart';
import 'package:study_flow/presentation/create_account/view/create_accout_view.dart';

class MockSaveTokenBloc extends MockBloc<SaveTokenEvent, SaveTokenState>
    implements SaveTokenBloc {}

class MockSaveUserLocalStorageBloc
    extends MockBloc<SaveUserLocalStorageEvent, SaveUserLocalStorageState>
    implements SaveUserLocalStorageBloc {}

class MockButtonManagerStatusBloc
    extends MockBloc<ButtonManagerStatusEvent, ButtonManagerStatusState>
    implements ButtonManagerStatusBloc {}

class MockSession extends Mock implements Session {}

void main() {
  late Widget child;
  late SaveUserLocalStorageBloc saveUserLocalStorageBloc;
  late ButtonManagerStatusBloc buttonManagerStatusBloc;
  late SaveTokenBloc saveTokenBloc;
  late Session session;

  setUp(() async {
    saveUserLocalStorageBloc = MockSaveUserLocalStorageBloc();
    buttonManagerStatusBloc = MockButtonManagerStatusBloc();
    saveTokenBloc = MockSaveTokenBloc();
    session = MockSession();

    await getIt.reset();

    getIt.registerFactory<SaveTokenBloc>(() => saveTokenBloc);
    getIt.registerSingleton<Session>(session);
    getIt.registerFactory<ButtonManagerStatusBloc>(
      () => buttonManagerStatusBloc,
    );
    getIt.registerFactory<SaveUserLocalStorageBloc>(
      () => saveUserLocalStorageBloc,
    );

    child = MultiBlocProvider(
      providers: [
        BlocProvider<ButtonManagerStatusBloc>(
          create: (context) => buttonManagerStatusBloc,
        ),
        BlocProvider<SaveTokenBloc>(
          create: (context) => saveTokenBloc,
        ),
        BlocProvider<SaveUserLocalStorageBloc>(
          create: (context) => saveUserLocalStorageBloc,
        ),
      ],
      child: const MaterialApp(
        home: CreateAccountPage(),
      ),
    );
  });

  testWidgets('CreateAccountView should render correctly',
      (WidgetTester tester) async {
    // Arrange
    when(() => saveTokenBloc.state).thenReturn(
      const SaveTokenState(
        status: StatusEnum.initial,
      ),
    );

    when(() => saveUserLocalStorageBloc.state).thenReturn(
      const SaveUserLocalStorageState(
        status: StatusEnum.initial,
      ),
    );

    when(() => buttonManagerStatusBloc.state).thenReturn(
      const ButtonManagerStatusState(
        status: StatusEnum.initial,
      ),
    );

    // Act
    await tester.pumpWidget(child);

    // Assert
    expect(find.byType(CreateAccountView), findsOneWidget);
    expect(find.text('StudyFlow'), findsOneWidget);
    expect(find.text('WID4 Software'), findsOneWidget);
    expect(find.byType(InputFormWidget), findsOneWidget);
    expect(find.byType(ButtonMainWidget), findsOneWidget);
  });
}
