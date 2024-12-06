// import 'package:login_singin/services/api_service.dart';

// class LoginRepository {
//   Future<Map<String, dynamic>> login(String email, String password) async {
//     try {
//       final data = {
//         'email': email.trim(),
//         'password': password.trim()
//       };

//       final response = await ApiService.post('/login-page', data);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

import 'package:login_singin/auth/auth_service.dart';
import 'package:login_singin/services/api_service.dart';

class LoginRepository {
  final AuthService _authService = AuthService();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final data = {
        'email': email.trim(),
        'password': password.trim()
      };

      final response = await ApiService.post('/login-page', data, headers: {
        'Content-Type': 'application/json',
      });
      
      // Assuming the response contains a 'token' and 'user' field
      if (response['token'] != null) {
        // Save the token securely
        await _authService.saveToken(response['token']);

        // Save user information
        await _authService.saveUserInfo(response['user'] ?? {});
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Method to check login status
  Future<bool> checkLoginStatus() async {
    return await _authService.isLoggedIn();
  }

  //------------------------------------ Method to logout-----------------------
  Future<void> logout() async {
    await _authService.logout();
  }
}