part of 'get_user_in_local_storage_bloc.dart';

class GetUserInLocalStorageState extends Equatable {
  final StatusEnum status;
  final UserEntity? userEntity;

  const GetUserInLocalStorageState({
    this.status = StatusEnum.initial,
    this.userEntity,
  });

  @override
  List<Object?> get props => [status, userEntity];

  GetUserInLocalStorageState copyWith({
    StatusEnum? status,
    UserEntity? userEntity,
  }) {
    return GetUserInLocalStorageState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
