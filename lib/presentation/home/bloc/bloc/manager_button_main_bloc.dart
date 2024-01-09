import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/usecases/home/change_state_button_usecase.dart';

part 'manager_button_main_event.dart';
part 'manager_button_main_state.dart';

@injectable
class ManagerButtonMainBloc
    extends Bloc<ManagerButtonMainEvent, ManagerButtonMainState> {
  final ChangeStateButtonUsecase _changeStateButtonUsecase;

  ManagerButtonMainBloc(ChangeStateButtonUsecase changeStateButtonUsecase)
      : _changeStateButtonUsecase = changeStateButtonUsecase,
        super(const ManagerButtonMainState()) {
    on<ManagerButtonMain>(_changeStateButton);
  }

  Future<void> _changeStateButton(
      ManagerButtonMain event, Emitter<ManagerButtonMainState> emit) async {
    final ButtonState buttonState = await _changeStateButtonUsecase(
      ChangeStateButtonParams(
        buttonState: event.buttonState,
        isShotBreak: event.isShotBreak,
      ),
    );

    emit(state.copyWith(
      buttonState: buttonState,
      status: StatusEnum.success,
    ));
  }
}
