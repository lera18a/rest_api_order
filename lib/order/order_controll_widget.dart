import 'package:flutter/material.dart';
import 'package:rest_api_order/order/controller/order_controller.dart';
import 'package:rest_api_order/order/widgets/api_error_widget.dart';
import 'package:rest_api_order/order/widgets/initial_widget.dart';
import 'package:rest_api_order/order/widgets/loading_widget.dart';
import 'package:rest_api_order/order/widgets/order_widget.dart';
import 'package:rest_api_order/order/widgets/success_widget.dart';

class OrderControllWidget extends StatefulWidget {
  const OrderControllWidget({super.key, required this.controller});

  final OrderController controller;

  @override
  State<OrderControllWidget> createState() => _OrderControllWidgetState();
}

class _OrderControllWidgetState extends State<OrderControllWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onStateChanged);
  }

  void _onStateChanged() => setState(() {});

  void _handleCreateOrder() {
    widget.controller.submitOrder(1, 1);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onStateChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrderWidget(
      isLoading: widget.controller.isLoading,
      onCreate: _handleCreateOrder,
      buttonText: widget.controller.state == OrderState.success
          ? 'Создать ещё заказ'
          : 'Создать заказ',
      child: switch (widget.controller.state) {
        OrderState.initial => const InitialWidget(),
        OrderState.loading => const LoadingWidget(),
        OrderState.success => SuccessWidget(order: widget.controller.order),
        OrderState.error => ApiErrorWidget(
          error: widget.controller.errorText ?? '',
        ),
      },
    );
  }
}
