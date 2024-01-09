part of 'get_user_bloc.dart';

sealed class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class GetUser extends GetUserEvent {
  final String idUser;

  const GetUser({required this.idUser});

  @override
  List<Object> get props => [idUser];
}
