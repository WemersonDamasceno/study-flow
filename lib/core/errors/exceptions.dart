import 'package:equatable/equatable.dart';

class LocalStorageException extends Equatable implements Exception {
  final String? message;

  const LocalStorageException({this.message});

  @override
  List<Object?> get props => [message];
}
