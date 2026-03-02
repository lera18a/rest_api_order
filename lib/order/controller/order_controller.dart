import 'package:flutter/material.dart';
import 'package:rest_api_order/api/api_exception.dart';
import 'package:rest_api_order/api/order_repository.dart';
import 'package:rest_api_order/model/order.dart';

enum OrderState { initial, loading, success, error }

class OrderController extends ChangeNotifier {
  final OrderRepository repository;

  OrderController({required this.repository});

  OrderState state = OrderState.initial;
  Order? order;
  String? errorText;

  bool get isLoading => state == OrderState.loading;

  Future<void> submitOrder(int userId, int serviceId) async {
    if (isLoading) return;
    state = OrderState.loading;
    errorText = null;
    order = null;
    notifyListeners();

    try {
      final result = await repository.createOrder(userId, serviceId);
      order = result;
      state = OrderState.success;
      notifyListeners();
    } on ApiException catch (e) {
      state = OrderState.error;
      errorText = e.toString();
      notifyListeners();
    } catch (e) {
      state = OrderState.error;
      errorText = 'Неизвестная ошибка: $e';
      notifyListeners();
    }
  }

  void reset() {
    state = OrderState.initial;
    order = null;
    errorText = null;
    notifyListeners();
  }
}
