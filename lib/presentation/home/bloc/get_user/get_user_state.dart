part of 'get_user_bloc.dart';

class GetUserState extends Equatable {
  final StatusEnum status;
  final UserEntity? userEntity;

  const GetUserState({
    this.status = StatusEnum.initial,
    this.userEntity,
  });

  GetUserState copyWith({
    StatusEnum? status,
    UserEntity? userEntity,
  }) {
    return GetUserState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
    );
  }

  @override
  List<Object?> get props => [status, userEntity];
}
