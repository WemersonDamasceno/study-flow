part of 'get_token_in_local_storage_bloc.dart';

sealed class GetTokenInLocalStorageEvent extends Equatable {
  const GetTokenInLocalStorageEvent();
}

class GetUserInLocalStorage extends GetTokenInLocalStorageEvent {
  final String key;

  const GetUserInLocalStorage({required this.key});

  @override
  List<Object> get props => [key];
}
