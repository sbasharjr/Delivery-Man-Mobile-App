import 'package:flutter_test/flutter_test.dart';
import 'package:delivery_man_app/models/order.dart';

void main() {
  group('Order Model Tests', () {
    test('Order.fromJson should create a valid Order object', () {
      // Arrange
      final json = {
        'id': 'ORD123',
        'customer_name': 'John Doe',
        'customer_phone': '+1234567890',
        'delivery_address': '123 Main St, City',
        'order_date': '2024-01-15',
        'total_amount': 50.99,
        'status': 'pending',
        'items': [
          {
            'name': 'Product 1',
            'quantity': 2,
            'price': 25.50,
          }
        ],
      };

      // Act
      final order = Order.fromJson(json);

      // Assert
      expect(order.id, 'ORD123');
      expect(order.customerName, 'John Doe');
      expect(order.customerPhone, '+1234567890');
      expect(order.deliveryAddress, '123 Main St, City');
      expect(order.totalAmount, 50.99);
      expect(order.status, 'pending');
      expect(order.items.length, 1);
      expect(order.items[0].name, 'Product 1');
    });

    test('Order.toJson should create a valid JSON map', () {
      // Arrange
      final order = Order(
        id: 'ORD123',
        customerName: 'John Doe',
        customerPhone: '+1234567890',
        deliveryAddress: '123 Main St, City',
        orderDate: '2024-01-15',
        totalAmount: 50.99,
        status: 'pending',
        items: [
          OrderItem(
            name: 'Product 1',
            quantity: 2,
            price: 25.50,
          ),
        ],
      );

      // Act
      final json = order.toJson();

      // Assert
      expect(json['id'], 'ORD123');
      expect(json['customer_name'], 'John Doe');
      expect(json['total_amount'], 50.99);
      expect(json['items'], isA<List>());
      expect(json['items'].length, 1);
    });

    test('Order.fromJson should handle missing optional fields', () {
      // Arrange
      final json = {
        'id': 'ORD123',
        'customer_name': 'John Doe',
        'customer_phone': '+1234567890',
        'delivery_address': '123 Main St, City',
        'order_date': '2024-01-15',
        'total_amount': 50.99,
        'status': 'pending',
        'items': [],
      };

      // Act
      final order = Order.fromJson(json);

      // Assert
      expect(order.latitude, isNull);
      expect(order.longitude, isNull);
      expect(order.specialInstructions, isNull);
    });
  });

  group('OrderItem Model Tests', () {
    test('OrderItem.fromJson should create a valid OrderItem object', () {
      // Arrange
      final json = {
        'name': 'Product 1',
        'quantity': 2,
        'price': 25.50,
        'image_url': 'https://example.com/image.jpg',
      };

      // Act
      final item = OrderItem.fromJson(json);

      // Assert
      expect(item.name, 'Product 1');
      expect(item.quantity, 2);
      expect(item.price, 25.50);
      expect(item.imageUrl, 'https://example.com/image.jpg');
    });

    test('OrderItem.toJson should create a valid JSON map', () {
      // Arrange
      final item = OrderItem(
        name: 'Product 1',
        quantity: 2,
        price: 25.50,
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      final json = item.toJson();

      // Assert
      expect(json['name'], 'Product 1');
      expect(json['quantity'], 2);
      expect(json['price'], 25.50);
      expect(json['image_url'], 'https://example.com/image.jpg');
    });
  });
}
