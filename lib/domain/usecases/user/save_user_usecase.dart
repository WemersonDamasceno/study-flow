import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@lazySingleton
class SaveUserUsecase implements UseCase<UserEntity, SaveUserParams> {
  final UserRepository _userRepository;

  SaveUserUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, UserEntity>> call(SaveUserParams params) async {
    return await _userRepository.saveUser(params.user);
  }
}

class SaveUserParams extends Equatable {
  final UserEntity user;

  const SaveUserParams({required this.user});

  @override
  List<Object?> get props => [user];
}
