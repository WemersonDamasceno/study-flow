import 'package:study_flow/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    required String nameUser,
  }) : super(
          id: id,
          nameUser: nameUser,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      nameUser: json['nameUser'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nameUser': nameUser,
    };
  }

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      id: entity.id,
      nameUser: entity.nameUser,
    );
  }

  UserModel copy({
    int? id,
    String? nameUser,
  }) {
    return UserModel(
      id: id ?? this.id,
      nameUser: nameUser ?? this.nameUser,
    );
  }
}
