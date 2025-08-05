import '../../../core/remote_datasource/remote_datasource.dart';

class ServiceApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<List<dynamic>> getServices() async {
    final response = await _remote.performGetListRequest('/api/services');
    return response;
  }
}