import 'package:icms_app/datamodel/user_login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static final String authTokenKey = 'auth_token';
  static final String userRoles = 'roles';

  static String getToken(SharedPreferences prefs) {
    return prefs.getString(authTokenKey);
  }

  static saveUserDetails(SharedPreferences prefs, UserLoginResp user) {
    prefs.setString(authTokenKey, user.access_token);
    prefs.setString(userRoles, user.roles);
  }

  static String getRoles(SharedPreferences prefs) {
    return prefs.getString(userRoles);
  }
}
