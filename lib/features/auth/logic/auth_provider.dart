import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../data/auth_api.dart';

class AuthProvider extends ChangeNotifier {
  static bool authenticated = false;
  static String? token;
  final AuthApi _authApi = AuthApi();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> login(String phone, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _authApi.login(phone, password);
      if (response.containsKey('token')) {
        await _storage.write(key: 'token', value: response['token']);
        token = response['token'];
        authenticated = true;
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: \$e");
    }
    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<bool> register(String name, String phone, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await _authApi.register(name, phone, email, password);
      if (response.containsKey('token')) {
        await _storage.write(key: 'token', value: response['token']);
        token = response['token'];
        authenticated = true;
        _isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Register error: \$e");
    }
    _isLoading = false;
    notifyListeners();
    return false;
  }

  Future<void> logout() async {
    await _storage.delete(key: 'token');
  }
}