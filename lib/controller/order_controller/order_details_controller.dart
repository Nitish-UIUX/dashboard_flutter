import 'package:flutter/foundation.dart';
import 'package:login_singin/auth/auth_service.dart';
import 'package:login_singin/services/api_service.dart';

class OrderDetailsController {
  final AuthService _authService = AuthService();

  //---------------------------------------------------------fetchOrderDetails--------------------------------------------------

  Future<dynamic> fetchOrderDetails(String orderId) async {
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

      // Construct the API endpoint
      final endpoint = '/admin/orders/$orderId';

      // Make the API call to fetch specific order details
      final response = await ApiService.get(endpoint, headers: headers);

      // Log details for debugging
      debugPrint('Token: $token');
      debugPrint('Order ID: $orderId');
      debugPrint('Endpoint: $endpoint');
      debugPrint('Response: ${response.toString()}');

      return response;
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error fetching order details: $e');
      rethrow; // Rethrow the error to be handled by the caller
    }
  }

  //  ---------------------------------------------------------updateOrder--------------------------------------------------
  Future<dynamic> updateOrder(String orderId, String status) async {
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

      // Prepare the body for status update
      final body = {'status': status};
      print(body);
      print(" order id : $orderId");

      // Make the API call to update order status
      final response = await ApiService.put('/admin/orders/$orderId',
          headers: headers, body: body);

      // Log details for debugging
      debugPrint('Updating order $orderId status to: $status');
      debugPrint('Response: ${response.toString()}');

      return response;
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error updating order status: $e');
      rethrow;
    }
  }

  //------------------------------------------------------------sendMail-----------------------------------------------------
  Future<dynamic> sendMail(String orderId, String userType) async {
    debugPrint("Order ID: $orderId");
    debugPrint("User Type: $userType");

    try {
      // Get the authentication token
      final token = await _authService.getToken();

      if (token == null) {
        throw Exception('Authentication token not found.');
      }

      // Prepare headers with the token
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      // Prepare the body for the API call
      final data = {'userType': userType};

      debugPrint('Request Body: $data');
      debugPrint('Headers: $headers');

      // Make the API call
      final response = await ApiService.post(
        '/admin/orders/send-order-email/$orderId',
        // data as Map<String, dynamic>,
        data,
        headers: headers,
      );

      // Log the response
      debugPrint('Sending mail for order $orderId');
      debugPrint('Response: ${response.toString()}');

      return response;
    } catch (e) {
      debugPrint('Error sending mail: $e');
      rethrow;
    }
  }

  //------------------------------------------------------------admin_notes-----------------------------------------------------
  Future<dynamic> updateAdminNotes(String orderId, String notes) async {
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

      // Prepare the body for status update
      final body = {'admin_notes': notes};
      print(body);
      print(" order id : $orderId");

      // Make the API call to update order status
      final response = await ApiService.put('/admin/orders/update-Admin-notes/$orderId',
          headers: headers, body: body);

      // Log details for debugging
      debugPrint('Updating order $orderId notes to: $notes');
      debugPrint('Response: ${response.toString()}');

      return response;
    } catch (e) {
      // Log the error for debugging
      debugPrint('Error updating order notes: $e');
      rethrow;
    }
  }
}
