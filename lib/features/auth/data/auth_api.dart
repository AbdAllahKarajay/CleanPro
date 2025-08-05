import '../../../core/remote_datasource/remote_datasource.dart';

class AuthApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<Map<String, dynamic>> login(String phone, String password) async {
    final response = await _remote.performPostRequest('/api/login', body: {
      'phone': phone,
      'password': password,
    });
    return response;
  }

  Future<Map<String, dynamic>> register(String name, String phone, String email, String password) async {
    final response = await _remote.performPostRequest('/api/register', body: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    });
    return response;
  }
}