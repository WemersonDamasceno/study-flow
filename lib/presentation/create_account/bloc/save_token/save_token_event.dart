part of 'save_token_bloc.dart';

sealed class SaveTokenEvent extends Equatable {
  const SaveTokenEvent();

  @override
  List<Object> get props => [];
}

class SaveToken extends SaveTokenEvent {
  final String token;

  const SaveToken({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
