class Order {
  final int orderId;
  final String status;
  final String? paymentUrl;

  Order({required this.orderId, required this.status, this.paymentUrl});

  factory Order.fromJson(Map<String, dynamic> json) {
    final orderId = json['order_id'] as int;
    final status = json['status'] as String;
    final paymentUrl = json['payment_url'] as String?;
    return Order(orderId: orderId, status: status, paymentUrl: paymentUrl);
  }
}
