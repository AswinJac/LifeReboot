import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  Future<bool> login(String email, String password) async {
    // In a real app, you'd want to hash the password and use secure storage
    final prefs = await SharedPreferences.getInstance();
    final storedPassword = prefs.getString(email);

    if (storedPassword == password) {
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('currentUser', email);
      return true;
    }
    return false;
  }

  Future<bool> register(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(email, password);
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('currentUser');
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }
}
