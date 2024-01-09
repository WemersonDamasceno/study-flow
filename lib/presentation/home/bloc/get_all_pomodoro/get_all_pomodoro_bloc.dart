import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/pomodoro_entity.dart';
import 'package:study_flow/domain/usecases/pomodoro/get_all_pomodoro_usecase.dart';

part 'get_all_pomodoro_event.dart';
part 'get_all_pomodoro_state.dart';

@injectable
class GetAllPomodoroBloc
    extends Bloc<GetAllPomodoroEvent, GetAllPomodoroState> {
  final GetAllPomodoroUsecase _getAllPomodoroUsecase;

  GetAllPomodoroBloc({required GetAllPomodoroUsecase getAllPomodoroUsecase})
      : _getAllPomodoroUsecase = getAllPomodoroUsecase,
        super(const GetAllPomodoroState()) {
    on<GetAllPomodoro>(_getAllPomodoro);
  }

  _getAllPomodoro(
    GetAllPomodoro event,
    Emitter<GetAllPomodoroState> emit,
  ) async {
    emit(state.copyWith(status: StatusEnum.loading));
    final result = await _getAllPomodoroUsecase(
      GetAllPomodoroUsecaseParams(userId: event.userId ?? ''),
    );
    result.fold(
      (failure) => emit(state.copyWith(status: StatusEnum.error)),
      (listPomodoro) => emit(state.copyWith(
        status: listPomodoro.isNotEmpty ? StatusEnum.success : StatusEnum.empty,
        pomodoros: listPomodoro,
      )),
    );
  }
}
