import 'remote_exceptions.dart';
import 'error_code.dart';

class ErrorHandler {
  static void Function()? onInvalidToken;
  static bool handleRemoteStatusCode(
      int statusCode, dynamic msg, Map<String, List<String>> headers) {
    if (statusCode >= 200 && statusCode < 300) {
      return true;
    } else if (statusCode == 400) {
      throw RemoteExceptions(ErrorCode.BADREQUEST, msg);
    } else if (statusCode == 401) {
      if (headers["www-authenticate"]?.first.contains('invalid_token') ??
          false) {
        (onInvalidToken??(){})();
      }
      throw RemoteExceptions(ErrorCode.UNAUTHENTICATED, msg);
    } else if (statusCode == 403) {
      throw RemoteExceptions(ErrorCode.FORBIDDEN, msg);
    } else if (statusCode >= 500) {
      throw RemoteExceptions(ErrorCode.SERVER_ERROR, msg);
    }
    throw RemoteExceptions(ErrorCode.UNKNOWN, msg);
  }
}
