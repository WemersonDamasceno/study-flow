import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String nameUser;

  const UserEntity({
    this.id,
    required this.nameUser,
  });

  UserEntity copyWith({int? id, String? nameUser}) {
    return UserEntity(
      id: id ?? this.id,
      nameUser: nameUser ?? this.nameUser,
    );
  }

  @override
  List<Object?> get props => [id, nameUser];
}
