import 'package:flutter/material.dart';
import '../data/service_api.dart';

class ServiceProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();
  List<Map<String, dynamic>> _services = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _api.getServices();
      _services = List<Map<String, dynamic>>.from(data);
    } catch (e) {
      print("Error fetching services: $e");
    }
    _isLoading = false;
    notifyListeners();
  }
}