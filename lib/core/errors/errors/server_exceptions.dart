import 'package:dio/dio.dart';

import 'base_app_exception.dart';

class ServerExceptions extends BaseAppException {
  ServerExceptions(
    String message, {
    int? statusCode,
  }) : super(
          message: message,
          statusCode: statusCode,
        );

  factory ServerExceptions.handle(dynamic e) {
    if (e is DioException) {
      return ServerExceptions.fromDiorError(e);
    } else {
      return ServerExceptions('Oops There was an Error, $e');
    }
  }

  factory ServerExceptions.fromDiorError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerExceptions(
          'Connection timeout with api server',
          statusCode: e.response?.statusCode,
        );

      case DioExceptionType.sendTimeout:
        return ServerExceptions(
          'Send timeout with ApiServer',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return ServerExceptions(
          'Receive timeout with ApiServer',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return ServerExceptions(
          'badCertificate with api server',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return ServerExceptions.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerExceptions(
          'Request to ApiServer was canceled',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ServerExceptions(
          'No Internet Connection',
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.unknown:
        return ServerExceptions(
          'Oops There was an Error, Please try again',
          statusCode: e.response?.statusCode,
        );
      default:
        return ServerExceptions(
          'Oops There was an Error, ${e.message}',
          statusCode: e.response?.statusCode,
        );
    }
  }

  factory ServerExceptions.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400: // bad request
      case 401: // unauthorized
      case 403: // forbidden
        return ServerExceptions(
          "${response['ErrorMessage']}",
          statusCode: statusCode,
        );
      case 404: // notFound
        return ServerExceptions(
          'Your request was not found, please try later',
          statusCode: statusCode,
        );
      case 500:
        return ServerExceptions(
          'There is a problem with server, please try later',
          statusCode: statusCode,
        );
      default:
        return ServerExceptions(
          'There was an error , please try again',
          statusCode: statusCode,
        );
    }
  }
}
