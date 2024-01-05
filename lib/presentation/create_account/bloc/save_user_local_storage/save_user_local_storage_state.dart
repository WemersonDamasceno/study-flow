part of 'save_user_local_storage_bloc.dart';

class SaveUserLocalStorageState extends Equatable {
  final StatusEnum status;
  final UserEntity? userEntity;

  const SaveUserLocalStorageState({
    this.status = StatusEnum.initial,
    this.userEntity,
  });

  @override
  List<Object?> get props => [status, userEntity];

  SaveUserLocalStorageState copyWith({
    StatusEnum? status,
    UserEntity? userEntity,
  }) {
    return SaveUserLocalStorageState(
      status: status ?? this.status,
      userEntity: userEntity ?? this.userEntity,
    );
  }
}
