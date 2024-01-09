import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/presentation/home/bloc/bloc/manager_button_main_bloc.dart';

@injectable
class ChangeStateButtonUsecase
    extends UseCaseSimple<ButtonState, ChangeStateButtonParams> {
  @override
  Future<ButtonState> call(ChangeStateButtonParams params) async {
    return _getNextButtonState(params.buttonState, params.isShotBreak);
  }

  ButtonState _getNextButtonState(ButtonState currentState, bool isShotBreak) {
    switch (currentState) {
      case ButtonState.init:
      case ButtonState.initBreak:
        return isShotBreak ? ButtonState.pauseBreak : ButtonState.pause;
      case ButtonState.pause:
      case ButtonState.pauseBreak:
        return isShotBreak ? ButtonState.resumeBreak : ButtonState.resume;
      case ButtonState.resume:
      case ButtonState.resumeBreak:
        return isShotBreak ? ButtonState.pauseBreak : ButtonState.pause;
      case ButtonState.end:
      case ButtonState.endBreak:
        return isShotBreak ? ButtonState.initBreak : ButtonState.init;
      default:
        currentState = ButtonState.end;
        return ButtonState.init;
    }
  }
}

class ChangeStateButtonParams extends Equatable {
  final ButtonState buttonState;
  final bool isShotBreak;

  const ChangeStateButtonParams({
    required this.isShotBreak,
    required this.buttonState,
  });

  @override
  List<Object> get props => [isShotBreak, buttonState];
}
