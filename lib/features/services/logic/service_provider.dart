import 'package:flutter/material.dart';
import '../data/service_api.dart';
import '../data/models/service.dart';

class ServiceProvider extends ChangeNotifier {
  final ServiceApi _api = ServiceApi();
  List<Service> _services = [];
  bool _isLoading = false;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await _api.getServices();
      _services = data;
    } catch (e) {
      print("Error fetching services: $e");
    }
    _isLoading = false;
    notifyListeners();
  }
}