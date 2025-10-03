import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/models/user.dart';

void main() {
  group('User Model Tests', () {
    test('User.fromJson should create a valid User object', () {
      // Arrange
      final json = {
        'id': 'USER123',
        'name': 'Jane Smith',
        'email': 'jane@example.com',
        'phone': '+1234567890',
        'profile_image': 'https://example.com/profile.jpg',
        'role': 'vendor',
        'is_active': true,
        'store_name': 'Jane\'s Store',
        'store_address': '123 Main St, City',
        'store_description': 'Best products in town',
      };

      // Act
      final user = User.fromJson(json);

      // Assert
      expect(user.id, 'USER123');
      expect(user.name, 'Jane Smith');
      expect(user.email, 'jane@example.com');
      expect(user.phone, '+1234567890');
      expect(user.profileImage, 'https://example.com/profile.jpg');
      expect(user.role, 'vendor');
      expect(user.isActive, true);
      expect(user.storeName, 'Jane\'s Store');
      expect(user.storeAddress, '123 Main St, City');
      expect(user.storeDescription, 'Best products in town');
    });

    test('User.toJson should create a valid JSON map', () {
      // Arrange
      final user = User(
        id: 'USER123',
        name: 'Jane Smith',
        email: 'jane@example.com',
        phone: '+1234567890',
        role: 'vendor',
        isActive: true,
        storeName: 'Jane\'s Store',
        storeAddress: '123 Main St, City',
        storeDescription: 'Best products in town',
      );

      // Act
      final json = user.toJson();

      // Assert
      expect(json['id'], 'USER123');
      expect(json['name'], 'Jane Smith');
      expect(json['email'], 'jane@example.com');
      expect(json['is_active'], true);
      expect(json['store_name'], 'Jane\'s Store');
      expect(json['store_address'], '123 Main St, City');
    });

    test('User.fromJson should handle missing optional fields', () {
      // Arrange
      final json = {
        'id': 'USER123',
        'name': 'Jane Smith',
        'email': 'jane@example.com',
        'phone': '+1234567890',
        'role': 'vendor',
      };

      // Act
      final user = User.fromJson(json);

      // Assert
      expect(user.profileImage, isNull);
      expect(user.storeName, isNull);
      expect(user.storeAddress, isNull);
      expect(user.storeDescription, isNull);
      expect(user.isActive, true); // Default value
    });
  });
}
