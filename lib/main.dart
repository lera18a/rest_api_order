import 'package:flutter/material.dart';
import 'package:rest_api_order/api/order_repository.dart';
import 'package:rest_api_order/order/order_controll_widget.dart';
import 'package:rest_api_order/order/controller/order_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrderController(repository: OrderRepository());
    return MaterialApp(
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blue)),
      home: OrderControllWidget(controller: controller),
    );
  }
}
