part of 'manager_button_main_bloc.dart';

class ManagerButtonMainState extends Equatable {
  final ButtonState buttonState;
  final StatusEnum status;

  const ManagerButtonMainState({
    this.status = StatusEnum.initial,
    this.buttonState = ButtonState.init,
  });

  ManagerButtonMainState copyWith({
    ButtonState? buttonState,
    StatusEnum? status,
  }) {
    return ManagerButtonMainState(
      status: status ?? this.status,
      buttonState: buttonState ?? this.buttonState,
    );
  }

  @override
  List<Object> get props => [buttonState];
}

enum ButtonState {
  init,
  pause,
  resume,
  end,

  initBreak,
  pauseBreak,
  resumeBreak,
  endBreak,
}
