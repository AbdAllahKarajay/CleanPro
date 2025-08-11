import '../../../core/remote_datasource/remote_datasource.dart';
import 'models/booking.dart';

class BookingApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<Map<String, dynamic>> createBooking({
    required int serviceId,
    required String scheduledAt,
    required String address,
    String? instructions,
    required double latitude,
    required double longitude,
  }) async {
    final response = await _remote.performPostRequest(
      '/api/bookings',
      body: {
        'service_id': serviceId,
        'scheduled_at': scheduledAt,
        'location': address,
        'latitude': latitude,
        'longitude': longitude,
        'special_instructions': instructions ?? '',
      },
    );
    return response;
  }

  Future<List<Booking>> getBookings() async {
    final response = await _remote.performGetListRequest<Booking>(
      '/api/bookings',
      fromMap: Booking.fromMap,
    );
    return response;
  }
}
