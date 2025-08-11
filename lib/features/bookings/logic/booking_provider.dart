import 'package:flutter/material.dart';
import '../data/booking_api.dart';
import '../data/models/booking.dart';
import '../../services/data/models/service.dart';

class BookingProvider extends ChangeNotifier {
  final BookingApi _bookingApi = BookingApi();
  Service? _selectedService;

  List<Booking> _bookings = [];
  bool isLoading = false;

  Service? get selectedService => _selectedService;
  List<Booking> get bookings => _bookings;

  void setSelectedService(Service service) {
    _selectedService = service;
    notifyListeners();
  }

  Future submitBooking({
    required String date,
    required String time,
    required String address,
    String? instructions,
    required double latitude,
    required double longitude,
  }) async {
    if (_selectedService == null || _selectedService!.id == null) return null;
    String scheduledAt = '$date $time';
    try {
      final response = await _bookingApi.createBooking(
        serviceId: _selectedService!.id!,
        scheduledAt: scheduledAt,
        address: address,
        instructions: instructions,
        latitude: latitude,
        longitude: longitude,
      );
      return response;
    } catch (e, s) {
      print("Booking failed: $e");
      print("Booking failed stack trace: $s");
      return null;
    }
  }

  Future<void> getBookings() async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await _bookingApi.getBookings();
      _bookings = response;
    } catch (e) {
      print("Error fetching bookings: $e");
    }
    isLoading = false;
    notifyListeners();
  }
}
