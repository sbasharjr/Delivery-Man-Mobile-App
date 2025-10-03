class Order {
  final String id;
  final String customerName;
  final String customerPhone;
  final String deliveryAddress;
  final String orderDate;
  final double totalAmount;
  final String status; // 'pending', 'accepted', 'preparing', 'ready', 'completed', 'cancelled'
  final List<OrderItem> items;
  final double? latitude;
  final double? longitude;
  final String? specialInstructions;
  final String? paymentMethod;
  final String? deliveryType; // 'pickup', 'delivery'

  Order({
    required this.id,
    required this.customerName,
    required this.customerPhone,
    required this.deliveryAddress,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    required this.items,
    this.latitude,
    this.longitude,
    this.specialInstructions,
    this.paymentMethod,
    this.deliveryType,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] ?? '',
      customerName: json['customer_name'] ?? '',
      customerPhone: json['customer_phone'] ?? '',
      deliveryAddress: json['delivery_address'] ?? '',
      orderDate: json['order_date'] ?? '',
      totalAmount: (json['total_amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'pending',
      items: (json['items'] as List<dynamic>?)
              ?.map((item) => OrderItem.fromJson(item))
              .toList() ??
          [],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      specialInstructions: json['special_instructions'],
      paymentMethod: json['payment_method'],
      deliveryType: json['delivery_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'customer_name': customerName,
      'customer_phone': customerPhone,
      'delivery_address': deliveryAddress,
      'order_date': orderDate,
      'total_amount': totalAmount,
      'status': status,
      'items': items.map((item) => item.toJson()).toList(),
      'latitude': latitude,
      'longitude': longitude,
      'special_instructions': specialInstructions,
      'payment_method': paymentMethod,
      'delivery_type': deliveryType,
    };
  }
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;
  final String? imageUrl;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.imageUrl,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
      'image_url': imageUrl,
    };
  }
}
