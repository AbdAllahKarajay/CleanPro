import 'package:flutter/material.dart';
import '../data/booking_api.dart';

class BookingProvider extends ChangeNotifier {
  final BookingApi _bookingApi = BookingApi();
  Map<String, dynamic>? selectedService;

  List<Map<String, dynamic>> bookings = [];
  bool isLoading = false;

  void setSelectedService(Map<String, dynamic> service) {
    selectedService = service;
    notifyListeners();
  }

  Future<Map<String, dynamic>?> submitBooking({
    required String date,
    required String time,
    required String address,
    String? instructions,
  }) async {
    if (selectedService == null) return null;
    String scheduledAt = '$date $time';
    try {
      final response = await _bookingApi.createBooking(
        serviceId: selectedService!['id'],
        scheduledAt: scheduledAt,
        address: address,
        instructions: instructions,
      );
      return response;
    } catch (e) {
      print("Booking failed: $e");
      return null;
    }
  }

  Future<void> getBookings() async {
    isLoading = true;
    notifyListeners();
    final response = await _bookingApi.getBookings();
    bookings = response;
    isLoading = false;
    notifyListeners();
  }
}