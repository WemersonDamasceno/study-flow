import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@lazySingleton
class GetUserUsecase extends UseCase<UserEntity, GetUserParams> {
  final UserRepository _repository;

  GetUserUsecase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(GetUserParams params) async {
    return await _repository.getUser(params.idUser);
  }
}

class GetUserParams extends Equatable {
  final String idUser;

  const GetUserParams({required this.idUser});

  @override
  List<Object?> get props => [idUser];
}
