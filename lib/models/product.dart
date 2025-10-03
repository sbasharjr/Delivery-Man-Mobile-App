class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final String category;
  final int stockQuantity;
  final bool isAvailable;
  final String? unit; // 'pcs', 'kg', 'ltr', etc.

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.stockQuantity,
    this.isAvailable = true,
    this.unit,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      imageUrl: json['image_url'],
      category: json['category'] ?? '',
      stockQuantity: json['stock_quantity'] ?? 0,
      isAvailable: json['is_available'] ?? true,
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'category': category,
      'stock_quantity': stockQuantity,
      'is_available': isAvailable,
      'unit': unit,
    };
  }
}
