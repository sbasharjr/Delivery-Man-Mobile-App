import 'package:flutter/foundation.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import '../services/storage_service.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;

  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;

  final ApiService _apiService = ApiService();
  final StorageService _storageService = StorageService();

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.login(email, password);
      if (response['success'] == true) {
        _currentUser = User.fromJson(response['user']);
        await _storageService.saveToken(response['token']);
        await _storageService.saveUser(_currentUser!);
      } else {
        _errorMessage = response['message'] ?? 'Login failed';
      }
    } catch (e) {
      _errorMessage = 'An error occurred during login';
      if (kDebugMode) {
        print('Login error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(Map<String, dynamic> userData) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.register(userData);
      if (response['success'] == true) {
        _currentUser = User.fromJson(response['user']);
        await _storageService.saveToken(response['token']);
        await _storageService.saveUser(_currentUser!);
      } else {
        _errorMessage = response['message'] ?? 'Registration failed';
      }
    } catch (e) {
      _errorMessage = 'An error occurred during registration';
      if (kDebugMode) {
        print('Registration error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadUserFromStorage() async {
    try {
      final user = await _storageService.getUser();
      if (user != null) {
        _currentUser = user;
        notifyListeners();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading user from storage: $e');
      }
    }
  }

  Future<void> logout() async {
    _currentUser = null;
    await _storageService.clearAll();
    notifyListeners();
  }

  Future<void> updateProfile(Map<String, dynamic> updates) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.updateProfile(updates);
      if (response['success'] == true) {
        _currentUser = User.fromJson(response['user']);
        await _storageService.saveUser(_currentUser!);
      } else {
        _errorMessage = response['message'] ?? 'Profile update failed';
      }
    } catch (e) {
      _errorMessage = 'An error occurred while updating profile';
      if (kDebugMode) {
        print('Profile update error: $e');
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
