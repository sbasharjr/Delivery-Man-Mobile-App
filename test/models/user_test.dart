import 'package:flutter_test/flutter_test.dart';
import 'package:delivery_man_app/models/user.dart';

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
        'role': 'delivery_man',
        'is_active': true,
        'vehicle_type': 'Motorcycle',
        'vehicle_number': 'ABC-123',
      };

      // Act
      final user = User.fromJson(json);

      // Assert
      expect(user.id, 'USER123');
      expect(user.name, 'Jane Smith');
      expect(user.email, 'jane@example.com');
      expect(user.phone, '+1234567890');
      expect(user.profileImage, 'https://example.com/profile.jpg');
      expect(user.role, 'delivery_man');
      expect(user.isActive, true);
      expect(user.vehicleType, 'Motorcycle');
      expect(user.vehicleNumber, 'ABC-123');
    });

    test('User.toJson should create a valid JSON map', () {
      // Arrange
      final user = User(
        id: 'USER123',
        name: 'Jane Smith',
        email: 'jane@example.com',
        phone: '+1234567890',
        role: 'delivery_man',
        isActive: true,
        vehicleType: 'Motorcycle',
        vehicleNumber: 'ABC-123',
      );

      // Act
      final json = user.toJson();

      // Assert
      expect(json['id'], 'USER123');
      expect(json['name'], 'Jane Smith');
      expect(json['email'], 'jane@example.com');
      expect(json['is_active'], true);
      expect(json['vehicle_type'], 'Motorcycle');
    });

    test('User.fromJson should handle missing optional fields', () {
      // Arrange
      final json = {
        'id': 'USER123',
        'name': 'Jane Smith',
        'email': 'jane@example.com',
        'phone': '+1234567890',
        'role': 'delivery_man',
      };

      // Act
      final user = User.fromJson(json);

      // Assert
      expect(user.profileImage, isNull);
      expect(user.vehicleType, isNull);
      expect(user.vehicleNumber, isNull);
      expect(user.isActive, true); // Default value
    });
  });
}
