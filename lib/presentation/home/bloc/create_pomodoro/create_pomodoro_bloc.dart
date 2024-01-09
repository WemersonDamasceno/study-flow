import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/usecases/pomodoro/save_pomodoro_usecase.dart';

part 'create_pomodoro_event.dart';
part 'create_pomodoro_state.dart';

@injectable
class CreatePomodoroBloc
    extends Bloc<CreatePomodoroEvent, CreatePomodoroState> {
  final SavePomodoroUsecase _savePomodoroUsecase;

  CreatePomodoroBloc({required SavePomodoroUsecase savePomodoroUsecase})
      : _savePomodoroUsecase = savePomodoroUsecase,
        super(const CreatePomodoroState()) {
    on<CreatePomodoro>(_createPomodoro);
  }

  _createPomodoro(
    CreatePomodoro event,
    Emitter<CreatePomodoroState> emit,
  ) async {
    emit(state.copyWith(status: StatusEnum.loading));
    final result = await _savePomodoroUsecase(
      SavePomodoroUsecaseParams(pomodoroEntity: event.pomodoroEntity),
    );

    emit(result.fold(
      (failure) => state.copyWith(status: StatusEnum.error),
      (success) => state.copyWith(status: StatusEnum.success),
    ));
  }
}
