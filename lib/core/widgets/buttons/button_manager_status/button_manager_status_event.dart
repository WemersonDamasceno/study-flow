part of 'button_manager_status_bloc.dart';

sealed class ButtonManagerStatusEvent extends Equatable {
  const ButtonManagerStatusEvent();

  @override
  List<Object> get props => [];
}

class ButtonManagerStatus extends ButtonManagerStatusEvent {
  final StatusEnum status;

  const ButtonManagerStatus({
    required this.status,
  });

  @override
  List<Object> get props => [status];
}
