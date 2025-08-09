import '../../../core/remote_datasource/remote_datasource.dart';
import 'models/booking.dart';

class BookingApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<Booking> createBooking({
    required int serviceId,
    required String scheduledAt,
    required String address,
    String? instructions,
  }) async {
    final response = await _remote.performPostRequest<Booking>(
      '/api/bookings',
      body: {
        'service_id': serviceId,
        'scheduled_at': scheduledAt,
        'location': address,
        'special_instructions': instructions ?? '',
      },
      fromMap: Booking.fromMap,
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
