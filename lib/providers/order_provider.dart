import 'package:flutter/foundation.dart';
import '../models/order.dart';
import '../services/api_service.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  Order? _selectedOrder;
  bool _isLoading = false;
  String? _errorMessage;

  List<Order> get orders => _orders;
  Order? get selectedOrder => _selectedOrder;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<Order> get pendingOrders =>
      _orders.where((order) => order.status == 'pending').toList();

  List<Order> get activeOrders =>
      _orders.where((order) => order.status == 'accepted' || order.status == 'preparing').toList();

  List<Order> get readyOrders =>
      _orders.where((order) => order.status == 'ready').toList();

  List<Order> get completedOrders =>
      _orders.where((order) => order.status == 'completed').toList();

  final ApiService _apiService = ApiService();

  Future<void> fetchOrders() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.getOrders();
      if (response['success'] == true) {
        _orders = (response['orders'] as List)
            .map((orderJson) => Order.fromJson(orderJson))
            .toList();
      } else {
        _errorMessage = response['message'] ?? 'Failed to fetch orders';
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching orders';
      if (kDebugMode) {
        print('Fetch orders error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchOrderById(String orderId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.getOrderById(orderId);
      if (response['success'] == true) {
        _selectedOrder = Order.fromJson(response['order']);
      } else {
        _errorMessage = response['message'] ?? 'Failed to fetch order details';
      }
    } catch (e) {
      _errorMessage = 'An error occurred while fetching order details';
      if (kDebugMode) {
        print('Fetch order details error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> updateOrderStatus(String orderId, String newStatus) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.updateOrderStatus(orderId, newStatus);
      if (response['success'] == true) {
        final index = _orders.indexWhere((order) => order.id == orderId);
        if (index != -1) {
          _orders[index] = Order.fromJson(response['order']);
        }
        if (_selectedOrder?.id == orderId) {
          _selectedOrder = Order.fromJson(response['order']);
        }
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response['message'] ?? 'Failed to update order status';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred while updating order status';
      if (kDebugMode) {
        print('Update order status error: $e');
      }
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void selectOrder(Order order) {
    _selectedOrder = order;
    notifyListeners();
  }

  void clearSelectedOrder() {
    _selectedOrder = null;
    notifyListeners();
  }
}
