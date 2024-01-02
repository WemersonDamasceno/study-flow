import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:study_flow/core/errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseStream<Type, Params> {
  Stream<Type> call(Params params);
}

abstract class UseCaseSimple<Type, Params> {
  Future<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
