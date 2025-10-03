import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  Product? _selectedProduct;
  bool _isLoading = false;
  String? _errorMessage;

  List<Product> get products => _products;
  Product? get selectedProduct => _selectedProduct;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<Product> get availableProducts =>
      _products.where((product) => product.isAvailable).toList();

  List<Product> get outOfStockProducts =>
      _products.where((product) => !product.isAvailable || product.stockQuantity == 0).toList();

  final ApiService _apiService = ApiService();

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.getProducts();
      if (response['success'] == true) {
        _products = (response['products'] as List)
            .map((productJson) => Product.fromJson(productJson))
            .toList();
      } else {
        _errorMessage = response['message'] ?? 'Failed to fetch products';
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching products';
      if (kDebugMode) {
        print('Fetch products error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addProduct(Map<String, dynamic> productData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.addProduct(productData);
      if (response['success'] == true) {
        await fetchProducts();
        return true;
      } else {
        _errorMessage = response['message'] ?? 'Failed to add product';
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred while adding product';
      if (kDebugMode) {
        print('Add product error: $e');
      }
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateProduct(String productId, Map<String, dynamic> updates) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.updateProduct(productId, updates);
      if (response['success'] == true) {
        await fetchProducts();
        return true;
      } else {
        _errorMessage = response['message'] ?? 'Failed to update product';
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred while updating product';
      if (kDebugMode) {
        print('Update product error: $e');
      }
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteProduct(String productId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.deleteProduct(productId);
      if (response['success'] == true) {
        await fetchProducts();
        return true;
      } else {
        _errorMessage = response['message'] ?? 'Failed to delete product';
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred while deleting product';
      if (kDebugMode) {
        print('Delete product error: $e');
      }
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }

  void clearSelectedProduct() {
    _selectedProduct = null;
    notifyListeners();
  }
}
