import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'error_handling/error_code.dart';
import 'error_handling/error_handler.dart';
import 'error_handling/remote_exceptions.dart';

class RemoteDatasource {
  static RemoteDatasource? _instance;

  RemoteDatasource();

  late bool Function() loginGetter;
  late String Function() tokenGetter;

  void init({
    required void Function() onInvalidToken,
    required bool Function() loginGetter,
    required String Function() tokenGetter,
  }) {
    ErrorHandler.onInvalidToken = onInvalidToken;
    apiUrl = dotenv.env['API_URL'] ?? apiUrl;
    this.loginGetter = loginGetter;
    this.tokenGetter = tokenGetter;
  }

  static RemoteDatasource get instance {
    _instance ??= RemoteDatasource();
    return _instance!;
  }

  final Dio dio = Dio();

  static String apiUrl = "http://localhost:8000";

  static Uri uri = Uri.parse(apiUrl);

  Future performPostRequest<T>(
    String endpoint, {
    dynamic body,
    dynamic params,
    T Function(Map<String, dynamic>)? fromMap,
    bool useToken = true,
    String contentType = 'application/json',
    bool encrypt = false,
    bool isResponseEncrypted = false,
  }) async {
    print('endpoints  is $endpoint');
    print('data  is $body');
    if (body is FormData) {
      print('data  is ${body.fields}');
    }
    print('data  is $body');
    if (encrypt) {
      print("encryption");
    }
    try {
      final response = await dio.post(
        uri.resolve(endpoint).toString(),
        queryParameters: params,
        data: body,
        options: await setOptions(useToken, contentType: contentType),
      );
      print("sd");
      if (kDebugMode) {
        if (isResponseEncrypted) {
          print("encrypted response");
        }
        print('$endpoint: response is $response');
      }
      if (ErrorHandler.handleRemoteStatusCode(
        response.statusCode!,
        response.data,
        response.headers.map,
      )) {
        return fromMap == null ? response.data : fromMap(response.data);
      } else {
        throw Exception("Error");
      }
    } catch (e, s) {
      print('Api Error is: $e');
      print('stack is : $s');
      if (e is RemoteExceptions) rethrow;
      if (e is DioException) {
        print("${e.message}, ${e.response}");
        throw ErrorHandler.handleRemoteStatusCode(
          e.response?.statusCode ?? 400,
          e.response?.data,
          e.response?.headers.map ?? {},
        );
      } else {
        throw RemoteExceptions(ErrorCode.APP_ERROR, e.toString());
      }
    }
  }

  Future performPostListRequest<T>(
    String endpoint, {
    dynamic body,
    dynamic params,
    bool printResponse = true,
    T Function(Map<String, dynamic>)? fromMap,
    bool useToken = true,
    bool encrypt = false,
    bool isResponseEncrypted = false,
  }) async {
    print('endpoints  is $endpoint');
    print('data  is $body');
    if (encrypt) {
      print("encryption");
    }
    try {
      final response = await dio.post(
        uri.resolve(endpoint).toString(),
        queryParameters: params,
        data: body,
        options: await setOptions(useToken),
      );
      if (kDebugMode && printResponse) {
        if (isResponseEncrypted) {
          print("encrypted response");
        }
        print('$endpoint: response is $response');
      }
      if (ErrorHandler.handleRemoteStatusCode(
        response.statusCode!,
        response.data,
        response.headers.map,
      )) {
        return fromMap == null
            ? response.data
            : response.data.map<T>((e) => fromMap(e)).toList();
      } else {
        throw Exception("Error");
      }
    } catch (e, stacktrace) {
      print(stacktrace);
      print('Api($endpoint) Error is: $e');
      if (e is RemoteExceptions) rethrow;
      if (e is DioException) {
        throw ErrorHandler.handleRemoteStatusCode(
          e.response?.statusCode ?? 400,
          e.response?.data,
          e.response?.headers.map ?? {},
        );
      } else {
        throw RemoteExceptions(ErrorCode.APP_ERROR, e.toString());
      }
    }
  }

  Future<T> performGetRequest<T>(
    String endpoint, {
    T Function(Map<String, dynamic>)? fromMap,
    Map<String, dynamic>? params,
    bool useToken = true,
    bool isResponseEncrypted = false,
  }) async {
    print('endpoints  is $endpoint');
    try {
      final response = await dio.get(
        uri.resolve(endpoint).toString(),
        queryParameters: params,
        options: await setOptions(useToken),
      );
      if (isResponseEncrypted) {
        print("encrypted response");
      }
      print('$endpoint: response is $response');
      if (ErrorHandler.handleRemoteStatusCode(
        response.statusCode!,
        response.data,
        response.headers.map,
      )) {
        return fromMap != null
            ? fromMap(response.data)
            : response.data is Map<String, dynamic> &&
                response.data.containsKey('data')
            ? response.data['data']
            : response.data;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print('Api($endpoint) Error is: $e');
      if (e is RemoteExceptions) rethrow;
      if (e is DioException) {
        throw ErrorHandler.handleRemoteStatusCode(
          e.response?.statusCode ?? 400,
          e.response?.data,
          e.response?.headers.map ?? {},
        );
      } else {
        throw RemoteExceptions(ErrorCode.APP_ERROR, e);
      }
    }
  }

  Future<List<T>> performGetListRequest<T>(
    String endpoint, {
    T Function(Map<String, dynamic>)? fromMap,
    Map<String, dynamic>? params,
    bool useToken = true,
    bool isResponseEncrypted = false,
  }) async {
    print('endpoints  is $endpoint');
    try {
      final response = await dio.get(
        uri.resolve(endpoint).toString(),
        queryParameters: params,
        options: await setOptions(useToken),
      );
      if (isResponseEncrypted) {
        print("encrypted response");
      }
      print('$endpoint: response is $response');
      if (ErrorHandler.handleRemoteStatusCode(
        response.statusCode!,
        response.data,
        response.headers.map,
      )) {
        List<T> result = [];
        final list =
            response.data is Map<String, dynamic> &&
                    response.data.containsKey('data')
                ? response.data['data']
                : response.data;
        for (var element in list) {
          result.add((fromMap != null) ? fromMap(element) : element);
        }
        return result;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print('Api($endpoint) Error is: $e\n');
      if (e is RemoteExceptions) rethrow;
      if (e is DioException) {
        throw ErrorHandler.handleRemoteStatusCode(
          e.response?.statusCode ?? 400,
          e.response?.data,
          e.response?.headers.map ?? {},
        );
      } else {
        throw RemoteExceptions(ErrorCode.APP_ERROR, e.toString());
      }
    }
  }

  Future<Options> setOptions(
    bool useToken, {
    String contentType = 'application/json',
  }) async {
    Options options = Options();
    if (useToken || loginGetter()) {
      options.headers = {
        'Content-Type': contentType,
        'Accept': 'application/json',
        if (loginGetter()) 'Authorization': 'Bearer ${tokenGetter()}',
      };
    } else {
      options.headers = {
        'Content-Type': contentType,
        'Accept': 'application/json',
      };
    }
    return options;
  }
}
