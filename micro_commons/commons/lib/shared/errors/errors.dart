abstract class Failure {
  String? get message;
}

class UnauthorizedError extends Failure {
  @override
  final String? message;
  UnauthorizedError({
    this.message,
  });
}

class InternalServerError extends Failure {
  @override
  final String? message;

  InternalServerError({
    this.message,
  });
}

class FizComunicationError extends Failure {
  @override
  final String? message;

  FizComunicationError({
    this.message,
  });
}
