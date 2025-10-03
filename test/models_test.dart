import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_mobile_app/models/vendor.dart';
import 'package:vendor_mobile_app/models/product.dart';
import 'package:vendor_mobile_app/models/order.dart';

void main() {
  group('Vendor Model Tests', () {
    test('Vendor model should serialize to JSON', () {
      final vendor = Vendor(
        id: '1',
        name: 'Test Vendor',
        email: 'test@example.com',
        phone: '+1234567890',
        address: '123 Main St',
        businessName: 'Test Business',
        isActive: true,
      );

      final json = vendor.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test Vendor');
      expect(json['email'], 'test@example.com');
      expect(json['is_active'], true);
    });

    test('Vendor model should deserialize from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test Vendor',
        'email': 'test@example.com',
        'phone': '+1234567890',
        'address': '123 Main St',
        'business_name': 'Test Business',
        'is_active': true,
      };

      final vendor = Vendor.fromJson(json);

      expect(vendor.id, '1');
      expect(vendor.name, 'Test Vendor');
      expect(vendor.email, 'test@example.com');
      expect(vendor.isActive, true);
    });
  });

  group('Product Model Tests', () {
    test('Product model should serialize to JSON', () {
      final product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Test Description',
        price: 29.99,
        imageUrl: 'https://example.com/image.jpg',
        stock: 100,
        category: 'Test Category',
        isAvailable: true,
      );

      final json = product.toJson();

      expect(json['id'], '1');
      expect(json['name'], 'Test Product');
      expect(json['price'], 29.99);
      expect(json['stock'], 100);
    });

    test('Product model should deserialize from JSON', () {
      final json = {
        'id': '1',
        'name': 'Test Product',
        'description': 'Test Description',
        'price': 29.99,
        'image_url': 'https://example.com/image.jpg',
        'stock': 100,
        'category': 'Test Category',
        'is_available': true,
      };

      final product = Product.fromJson(json);

      expect(product.id, '1');
      expect(product.name, 'Test Product');
      expect(product.price, 29.99);
      expect(product.stock, 100);
    });
  });

  group('Order Model Tests', () {
    test('Order model should serialize to JSON', () {
      final orderItem = OrderItem(
        productId: '1',
        productName: 'Test Product',
        quantity: 2,
        price: 29.99,
      );

      final order = Order(
        id: '1',
        customerId: '123',
        customerName: 'John Doe',
        items: [orderItem],
        total: 59.98,
        status: 'pending',
        orderDate: DateTime(2024, 1, 1),
        deliveryAddress: '123 Main St',
        notes: 'Test notes',
      );

      final json = order.toJson();

      expect(json['id'], '1');
      expect(json['customer_name'], 'John Doe');
      expect(json['total'], 59.98);
      expect(json['status'], 'pending');
      expect(json['items'].length, 1);
    });

    test('Order model should deserialize from JSON', () {
      final json = {
        'id': '1',
        'customer_id': '123',
        'customer_name': 'John Doe',
        'items': [
          {
            'product_id': '1',
            'product_name': 'Test Product',
            'quantity': 2,
            'price': 29.99,
          }
        ],
        'total': 59.98,
        'status': 'pending',
        'order_date': '2024-01-01T00:00:00.000',
        'delivery_address': '123 Main St',
        'notes': 'Test notes',
      };

      final order = Order.fromJson(json);

      expect(order.id, '1');
      expect(order.customerName, 'John Doe');
      expect(order.total, 59.98);
      expect(order.items.length, 1);
      expect(order.items[0].productName, 'Test Product');
    });
  });
}
