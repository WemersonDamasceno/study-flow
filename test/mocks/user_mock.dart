import 'package:study_flow/data/models/user/user_model.dart';
import 'package:study_flow/domain/entities/user_entity.dart';

class UserMock {
  static UserModel get model => const UserModel(
        id: '123',
        nameUser: "Jhon Doe",
      );

  static UserEntity get entity => UserEntity(
        id: model.id,
        nameUser: model.nameUser,
      );
}
