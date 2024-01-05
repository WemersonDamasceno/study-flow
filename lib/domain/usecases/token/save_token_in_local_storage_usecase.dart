import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/errors/failure.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/repositories/user/user_repository.dart';

@lazySingleton
class SaveTokenInLocalStorageUsecase
    implements UseCase<bool, SaveTokenInLocalStorageParams> {
  final UserRepository _userRepository;

  SaveTokenInLocalStorageUsecase({required UserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<Either<Failure, bool>> call(
      SaveTokenInLocalStorageParams params) async {
    return await _userRepository.saveToken(params.token);
  }
}

class SaveTokenInLocalStorageParams extends Equatable {
  final String token;

  const SaveTokenInLocalStorageParams({required this.token});

  @override
  List<Object?> get props => [token];
}
