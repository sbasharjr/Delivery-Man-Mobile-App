class Vendor {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String businessName;
  final bool isActive;

  Vendor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.businessName,
    required this.isActive,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      businessName: json['business_name'] ?? '',
      isActive: json['is_active'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'business_name': businessName,
      'is_active': isActive,
    };
  }
}
