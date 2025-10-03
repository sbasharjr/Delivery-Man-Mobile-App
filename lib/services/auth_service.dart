import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/vendor.dart';

class AuthService extends ChangeNotifier {
  Vendor? _currentVendor;
  bool _isAuthenticated = false;

  Vendor? get currentVendor => _currentVendor;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Mock authentication
    if (email.isNotEmpty && password.isNotEmpty) {
      _currentVendor = Vendor(
        id: '1',
        name: 'Demo Vendor',
        email: email,
        phone: '+1234567890',
        address: '123 Main St',
        businessName: 'MyGetWell Vendor',
        isActive: true,
      );
      _isAuthenticated = true;
      
      // Save session
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('vendor_email', email);
      await prefs.setBool('is_authenticated', true);
      
      notifyListeners();
      return true;
    }
    
    return false;
  }

  Future<void> logout() async {
    _currentVendor = null;
    _isAuthenticated = false;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuth = prefs.getBool('is_authenticated') ?? false;
    final email = prefs.getString('vendor_email');
    
    if (isAuth && email != null) {
      _currentVendor = Vendor(
        id: '1',
        name: 'Demo Vendor',
        email: email,
        phone: '+1234567890',
        address: '123 Main St',
        businessName: 'MyGetWell Vendor',
        isActive: true,
      );
      _isAuthenticated = true;
      notifyListeners();
    }
  }
}
