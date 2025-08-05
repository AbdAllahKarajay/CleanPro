import '../../../core/remote_datasource/remote_datasource.dart';

class BookingApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<Map<String, dynamic>> createBooking({
    required int serviceId,
    required String scheduledAt,
    required String address,
    String? instructions,
  }) async {
    final response = await _remote.performPostRequest('/api/bookings', body: {
      'service_id': serviceId,
      'scheduled_at': scheduledAt,

      'location': address,
      'special_instructions': instructions ?? '',
    });
    return response;
  }

  Future<List<Map<String, dynamic>>> getBookings() async {
    final response = await _remote.performGetListRequest('/api/bookings');
    return List.from(response);
  }
}