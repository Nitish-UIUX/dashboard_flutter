import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  
  // Keys for storing authentication data
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_info';

  // Save authentication token securely
  Future<void> saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  // Retrieve authentication token
  Future<String?> getToken() async {
    return await _secureStorage.read(key: _tokenKey);
  }

  // Remove authentication token
  Future<void> removeToken() async {
    await _secureStorage.delete(key: _tokenKey);
  }

  // Save user information (using SharedPreferences for non-sensitive data)
  Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(userInfo));
  }

  // Retrieve user information
  Future<Map<String, dynamic>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfoString = prefs.getString(_userKey);
    
    if (userInfoString != null) {
      return json.decode(userInfoString);
    }
    return null;
  }

  // Remove user information
  Future<void> removeUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Clear all authentication data
  Future<void> logout() async {
    await removeToken();
    await removeUserInfo();
  }
}