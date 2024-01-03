part of 'button_manager_status_bloc.dart';

class ButtonManagerStatusState extends Equatable {
  final StatusEnum status;

  const ButtonManagerStatusState({
    this.status = StatusEnum.initial,
  });

  @override
  List<Object> get props => [status];

  ButtonManagerStatusState copyWith({
    StatusEnum? status,
  }) {
    return ButtonManagerStatusState(
      status: status ?? this.status,
    );
  }
}
