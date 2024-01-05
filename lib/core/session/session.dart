import 'package:injectable/injectable.dart';
import 'package:study_flow/domain/entities/user_entity.dart';

@singleton
class Session {
  UserEntity? userEntity;

  static final Session _instance = Session._internal();

  factory Session() {
    return _instance;
  }

  Session._internal();

  dispose() {
    userEntity = null;
  }
}
