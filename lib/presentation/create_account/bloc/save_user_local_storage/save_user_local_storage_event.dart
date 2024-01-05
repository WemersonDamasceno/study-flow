part of 'save_user_local_storage_bloc.dart';

sealed class SaveUserLocalStorageEvent extends Equatable {
  const SaveUserLocalStorageEvent();
}

class SaveUserLocalStorage extends SaveUserLocalStorageEvent {
  final UserEntity userEntity;

  const SaveUserLocalStorage({required this.userEntity});

  @override
  List<Object> get props => [userEntity];
}
