class Order {
  final String code;
  final int cartId;
  final int userId;
  final String name;
  final String phoneNumber;
  final String shippingAddress;
  final int paymentMethod;
  final int shippingUnit;
  final int shippingCosts;
  final int totalOrder;
  final int total;
  final String status;
  final String createdAt;
  int rating; 
  String feedback; 

  Order({
    required this.code,
    required this.cartId,
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.shippingUnit,
    required this.shippingCosts,
    required this.totalOrder,
    required this.total,
    required this.status,
    required this.createdAt,
    this.rating = 0,
    this.feedback = '', 
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      code: json['code'],
      cartId: json['cart_id'],
      userId: json['user_id'],
      name: json['name'],
      phoneNumber: json['phone_number'],
      shippingAddress: json['shipping_address'],
      paymentMethod: json['payment_method'],
      shippingUnit: json['shipping_unit'],
      shippingCosts: json['shipping_costs'],
      totalOrder: json['total_order'],
      total: json['total'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }
}