import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/data/model/response/auth_response_model.dart';

class AuthLocalDataSource {
  // Save Auth Data
  Future<void> saveAuthData(AuthResponseModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModel.toJson());
  }

  // Remove Auth Data
  Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  // Get Auth Data
  Future<AuthResponseModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authDataUser = pref.getString('auth_data');
    return AuthResponseModel.fromJson(authDataUser!);
  }

  // is Auth Data
  Future<bool> isAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final authDataUser = prefs.getString('auth_data');
    return authDataUser != null;
  }
}
