import 'package:dartz/dartz.dart';
import 'package:study_flow/core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, bool>> saveToken(String token);
  Future<Either<Failure, bool>> removeToken();
}
