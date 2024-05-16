import 'package:dio/dio.dart';

import '../../errors/errors/server_exceptions.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
          error: true,
          request: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true),
    );
  }
  @override
  Future<Map<String, dynamic>> get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      throw (ServerExceptions.handle(e));
    }
  }

  @override
  Future<Map<String, dynamic>> patch(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    // TODO: implement patch
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> post(String path,
      {dynamic? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      throw (ServerExceptions.handle(e));
    }
  }

  @override
  Future<Map<String, dynamic>> delete(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      bool isFromData = false}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
