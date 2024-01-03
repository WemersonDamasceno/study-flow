import 'package:study_flow/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String nameUser,
  }) : super(
          id: id,
          nameUser: nameUser,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
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

  copy({
    String? id,
    String? nameUser,
  }) {
    return UserModel(
      id: id ?? this.id,
      nameUser: nameUser ?? this.nameUser,
    );
  }
}
