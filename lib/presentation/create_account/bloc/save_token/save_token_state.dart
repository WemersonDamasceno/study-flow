part of 'save_token_bloc.dart';

class SaveTokenState extends Equatable {
  final StatusEnum status;

  const SaveTokenState({
    this.status = StatusEnum.initial,
  });

  @override
  List<Object> get props => [status];

  SaveTokenState copyWith({
    StatusEnum? status,
  }) {
    return SaveTokenState(
      status: status ?? this.status,
    );
  }
}
