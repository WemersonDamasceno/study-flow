import 'package:dartz/dartz.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, bool>> saveToken(String token);
  Future<Either<Failure, bool>> removeToken();

  Future<Either<Failure, UserEntity>> saveUser(UserEntity user);
  Future<Either<Failure, UserEntity>> getUser(String id);
  Future<Either<Failure, bool>> removeUser(String id);
}
