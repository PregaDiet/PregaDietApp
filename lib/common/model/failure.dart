import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final Object? exception;

  final StackTrace? stackTrace;

  const Failure([
    this.exception,
    this.stackTrace,
  ]);

  @override
  List<Object?> get props => [
        exception,
        stackTrace,
      ];

  @override
  bool? get stringify => true;
}
