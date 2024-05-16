abstract class BaseAppException {
  final String message;
  final int? statusCode;

  BaseAppException({
    required this.message,
    this.statusCode,
  });
}
