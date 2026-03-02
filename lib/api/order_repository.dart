import 'dart:async';

import 'package:dio/dio.dart';
import 'package:rest_api_order/api/api_exception.dart';
import 'package:rest_api_order/model/order.dart';

class OrderRepository {
  late final dio = Dio(BaseOptions(validateStatus: (_) => true));
  final url = 'http://localhost:8000/api/orders';

  Future<Order> createOrder(int userId, int serviceId) async {
    try {
      final body = {'user_id': userId, 'service_id': serviceId};

      final response = await dio
          .post(url, data: body)
          .timeout(Duration(seconds: 10));

      final error = response.data?.toString();
      final code = response.statusCode ?? 0;
      if (code == 200) {
        return Order.fromJson(response.data);
      }

      if (code >= 400 && code < 500) {
        throw ApiException(errorType: ErrorType.clientError, error: error);
      }

      if (code >= 500) {
        throw ApiException(errorType: ErrorType.serverError, error: error);
      }
      throw ApiException(
        errorType: ErrorType.clientError,
        error: 'Неожиданный статус: $code',
      );
    } on TimeoutException {
      throw ApiException(errorType: ErrorType.timeOut);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw ApiException(errorType: ErrorType.noInternet);
      }
      throw ApiException(errorType: ErrorType.clientError, error: e.toString());
    }
  }
}
