import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

class SharedPrefFailure extends Failure {
  final String message;

  const SharedPrefFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
