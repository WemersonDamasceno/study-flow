part of 'get_token_bloc.dart';

sealed class GetTokenEvent extends Equatable {
  const GetTokenEvent();
}

class GetToken extends GetTokenEvent {
  const GetToken();

  @override
  List<Object> get props => [];
}
