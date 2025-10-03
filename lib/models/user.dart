class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String? profileImage;
  final String role; // 'vendor'
  final bool isActive;
  final String? storeName;
  final String? storeAddress;
  final String? storeDescription;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.profileImage,
    required this.role,
    this.isActive = true,
    this.storeName,
    this.storeAddress,
    this.storeDescription,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      profileImage: json['profile_image'],
      role: json['role'] ?? 'vendor',
      isActive: json['is_active'] ?? true,
      storeName: json['store_name'],
      storeAddress: json['store_address'],
      storeDescription: json['store_description'],
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
      'store_name': storeName,
      'store_address': storeAddress,
      'store_description': storeDescription,
    };
  }
}
