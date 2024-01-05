import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String nameUser;

  const UserEntity({
    this.id,
    required this.nameUser,
  });

  UserEntity copyWith({String? id, String? nameUser}) {
    return UserEntity(
      id: id ?? this.id,
      nameUser: nameUser ?? this.nameUser,
    );
  }

  @override
  List<Object?> get props => [id, nameUser];
}
