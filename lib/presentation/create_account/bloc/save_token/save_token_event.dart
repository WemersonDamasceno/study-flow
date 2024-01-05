part of 'save_token_bloc.dart';

sealed class SaveTokenEvent extends Equatable {
  const SaveTokenEvent();
}

class SaveToken extends SaveTokenEvent {
  final String token;

  const SaveToken({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
