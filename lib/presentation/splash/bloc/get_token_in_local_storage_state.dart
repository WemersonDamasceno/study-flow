part of 'get_token_in_local_storage_bloc.dart';

class GetTokenInLocalStorageState extends Equatable {
  final StatusEnum status;
  final String? token;

  const GetTokenInLocalStorageState({
    this.status = StatusEnum.initial,
    this.token,
  });

  @override
  List<Object?> get props => [status, token];

  GetTokenInLocalStorageState copyWith({
    StatusEnum? status,
    String? token,
  }) {
    return GetTokenInLocalStorageState(
      status: status ?? this.status,
      token: token ?? this.token,
    );
  }
}
