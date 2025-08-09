import '../../../core/remote_datasource/remote_datasource.dart';
import 'models/service.dart';

class ServiceApi {
  final RemoteDatasource _remote = RemoteDatasource.instance;

  Future<List<Service>> getServices() async {
    final response = await _remote.performGetListRequest<Service>(
      '/api/services',
      fromMap: Service.fromMap,
    );
    return response;
  }
}
