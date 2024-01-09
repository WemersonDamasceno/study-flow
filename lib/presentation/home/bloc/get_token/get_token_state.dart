part of 'get_token_bloc.dart';

class GetTokenState extends Equatable {
  final StatusEnum status;
  final String? token;

  const GetTokenState({
    this.status = StatusEnum.initial,
    this.token,
  });

  @override
  List<Object?> get props => [status, token];

  GetTokenState copyWith({
    StatusEnum? status,
    String? token,
  }) {
    return GetTokenState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
