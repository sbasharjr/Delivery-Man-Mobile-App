import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/models/product.dart';

void main() {
  group('Product Model Tests', () {
    test('Product.fromJson should create a valid Product object', () {
      // Arrange
      final json = {
        'id': 'PROD123',
        'name': 'Sample Product',
        'description': 'This is a sample product',
        'price': 29.99,
        'image_url': 'https://example.com/product.jpg',
        'category': 'Electronics',
        'stock_quantity': 50,
        'is_available': true,
        'unit': 'pcs',
      };

      // Act
      final product = Product.fromJson(json);

      // Assert
      expect(product.id, 'PROD123');
      expect(product.name, 'Sample Product');
      expect(product.description, 'This is a sample product');
      expect(product.price, 29.99);
      expect(product.imageUrl, 'https://example.com/product.jpg');
      expect(product.category, 'Electronics');
      expect(product.stockQuantity, 50);
      expect(product.isAvailable, true);
      expect(product.unit, 'pcs');
    });

    test('Product.toJson should create a valid JSON map', () {
      // Arrange
      final product = Product(
        id: 'PROD123',
        name: 'Sample Product',
        description: 'This is a sample product',
        price: 29.99,
        imageUrl: 'https://example.com/product.jpg',
        category: 'Electronics',
        stockQuantity: 50,
        isAvailable: true,
        unit: 'pcs',
      );

      // Act
      final json = product.toJson();

      // Assert
      expect(json['id'], 'PROD123');
      expect(json['name'], 'Sample Product');
      expect(json['description'], 'This is a sample product');
      expect(json['price'], 29.99);
      expect(json['image_url'], 'https://example.com/product.jpg');
      expect(json['category'], 'Electronics');
      expect(json['stock_quantity'], 50);
      expect(json['is_available'], true);
      expect(json['unit'], 'pcs');
    });

    test('Product.fromJson should handle missing optional fields', () {
      // Arrange
      final json = {
        'id': 'PROD123',
        'name': 'Sample Product',
        'description': 'This is a sample product',
        'price': 29.99,
        'category': 'Electronics',
        'stock_quantity': 50,
      };

      // Act
      final product = Product.fromJson(json);

      // Assert
      expect(product.imageUrl, isNull);
      expect(product.unit, isNull);
      expect(product.isAvailable, true); // Default value
    });

    test('Product should default isAvailable to true', () {
      // Arrange & Act
      final product = Product(
        id: 'PROD123',
        name: 'Sample Product',
        description: 'Test product',
        price: 19.99,
        category: 'Test',
        stockQuantity: 10,
      );

      // Assert
      expect(product.isAvailable, true);
    });
  });
}
