import 'base_app_exception.dart';

class CacheExceptions extends BaseAppException {
  CacheExceptions(
    String message, {
    int? statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  factory CacheExceptions.fromException(Exception e) {
    return CacheExceptions(e.toString());
  }

  factory CacheExceptions.fromError(Error e) {
    return CacheExceptions(e.toString());
  }
}
