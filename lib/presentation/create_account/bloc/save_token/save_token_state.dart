part of 'save_token_bloc.dart';

class SaveTokenState extends Equatable {
  final StatusEnum status;

  const SaveTokenState({
    this.status = StatusEnum.initial,
  });

  @override
  List<Object> get props => [status];
}
