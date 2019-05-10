// import 'package:icms_app/repository/user_repository.dart';

/// A class similar to http.Response but instead of a String describing the body
/// it already contains the parsed Dart-Object
class ParsedResponse<T> {
  static const int NO_INTERNET = 404;

  ParsedResponse(this.statusCode, this.body) {}

  final int statusCode;
  String _message;

  String get message => _message;

  set message(String message) {
    if (message == 'Authorization has been denied for this request.') {
//      UserRepository.logOut(context, _sharedPreferences);
    }
    _message = message;
  }

  final T body;

  bool isOk() {
    return statusCode >= 200 && statusCode < 300;
  }
}
