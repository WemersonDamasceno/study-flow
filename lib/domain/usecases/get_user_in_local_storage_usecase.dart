import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@lazySingleton
class GetUserInLocalStorageUsecase
    implements UseCase<UserEntity?, GetUserInLocalParams> {
  final UserRepository _userRepository;

  GetUserInLocalStorageUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, UserEntity?>> call(GetUserInLocalParams params) async {
    return await _userRepository.getUserInLocalStorage();
  }
}

class GetUserInLocalParams extends Equatable {
  final String key;

  const GetUserInLocalParams({required this.key});

  @override
  List<Object> get props => [key];
}
