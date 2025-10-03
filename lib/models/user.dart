class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final String role; // 'delivery_man'
  final bool isActive;
  final String? vehicleType;
  final String? vehicleNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.role,
    this.isActive = true,
    this.vehicleType,
    this.vehicleNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profile_image'],
      role: json['role'] ?? 'delivery_man',
      isActive: json['is_active'] ?? true,
      vehicleType: json['vehicle_type'],
      vehicleNumber: json['vehicle_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_image': profileImage,
      'role': role,
      'is_active': isActive,
      'vehicle_type': vehicleType,
      'vehicle_number': vehicleNumber,
    };
  }
}
