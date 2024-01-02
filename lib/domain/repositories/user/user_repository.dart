import 'package:dartz/dartz.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity?>> getUserInLocalStorage();
  Future<Either<Failure, void>> saveUserInLocalStorage(UserEntity user);
  Future<Either<Failure, void>> removeUserInLocalStorage();
}
