part of 'save_user_local_storage_bloc.dart';

sealed class SaveUserLocalStorageState extends Equatable {
  const SaveUserLocalStorageState();

  @override
  List<Object> get props => [];
}

final class SaveUserLocalStorageInitial extends SaveUserLocalStorageState {}
