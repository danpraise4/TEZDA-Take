class AppException implements Exception {
  final String message;
  final int? statusCode;
  final String? identifier;

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  @override
  String toString() {
    return 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
  }
}

class UnAuthenticatedException implements Exception {
  final String? message;

  UnAuthenticatedException({this.message});

  @override
  String toString() => message ?? '';
}
