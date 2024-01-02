part of 'get_user_in_local_storage_bloc.dart';

sealed class GetUserInLocalStorageEvent extends Equatable {
  const GetUserInLocalStorageEvent();
}

class GetUserInLocalStorage extends GetUserInLocalStorageEvent {
  final String key;

  const GetUserInLocalStorage({required this.key});

  @override
  List<Object> get props => [key];
}
