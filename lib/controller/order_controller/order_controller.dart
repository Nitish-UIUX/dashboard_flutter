import 'package:flutter/foundation.dart';
import 'package:login_singin/auth/auth_service.dart';
import 'package:login_singin/services/api_service.dart';

class OrderController {
  final AuthService _authService = AuthService();

  Future<dynamic> fetchOrders() async {
    try {
      // Get the authentication token
      final token = await _authService.getToken();

      if (token == null) {
        throw Exception('Authentication token not found.');
      }

      // Prepare headers with the token
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      // Make the API call
      final response = await ApiService.get('/admin/orders', headers: headers);

      // Log the token and response
      debugPrint('Token: $token');
      debugPrint('Response: ${response.toString()}');

      return response;
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error fetching orders: $e');
      rethrow; // Rethrow the error to be handled by the caller
    }
  }
}