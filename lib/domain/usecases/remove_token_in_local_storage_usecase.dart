import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@lazySingleton
class RemoveTokenInLocalStorageUsecase implements UseCase<bool, NoParams> {
  final UserRepository _userRepository;

  RemoveTokenInLocalStorageUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _userRepository.removeToken();
  }
}
