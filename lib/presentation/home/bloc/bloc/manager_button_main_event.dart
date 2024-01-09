part of 'manager_button_main_bloc.dart';

sealed class ManagerButtonMainEvent extends Equatable {
  const ManagerButtonMainEvent();
}

class ManagerButtonMain extends ManagerButtonMainEvent {
  final ButtonState buttonState;
  final bool isShotBreak;

  const ManagerButtonMain({
    required this.buttonState,
    required this.isShotBreak,
  });

  @override
  List<Object> get props => [buttonState, isShotBreak];
}
