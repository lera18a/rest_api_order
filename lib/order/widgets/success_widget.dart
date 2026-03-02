import 'package:flutter/material.dart';
import 'package:rest_api_order/model/order.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, this.order});

  final Order? order;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Заказ создан: #${order?.orderId ?? '-'}'),
        Text('Статус: ${order?.status ?? '-'}'),
        Text('Payment URL: ${order?.paymentUrl ?? 'null'}'),
        const SizedBox(height: 16),
      ],
    );
  }
}
