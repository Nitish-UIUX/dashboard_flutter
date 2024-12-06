// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   static const String baseUrl = 'http://89.116.20.161:5001/api';

//   //------------------------------------------------  post method  ------------------------------------------------
//   static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$baseUrl$endpoint'),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(data),
//       );

//       return _handleResponse(response);
//     } catch (e) {
//       throw Exception('Network error: $e');
//     }
//   }
//   static dynamic _handleResponse(http.Response response) {
//     if (response.statusCode >= 200 && response.statusCode < 300) {
//       return jsonDecode(response.body);
//     } else {
//       final error = jsonDecode(response.body);
//       throw Exception(error['error'] ?? 'An error occurred');
//     }
//   }
// }

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://89.116.20.161:5001/api';

  //------------------------------------------------  post method  ------------------------------------------------
  static Future<dynamic> post(String endpoint, Map<String, dynamic> data,
      {required Map<String, String> headers}) async {
    print("data : $data");
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  //------------------------------------------------  get method  ------------------------------------------------
  static Future<dynamic> get(String endpoint,
      {Map<String, String>? headers}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final error = jsonDecode(response.body);
      throw Exception(error['error'] ?? 'An error occurred');
    }
  }

  //------------------------------------------------  put method  ------------------------------------------------
  static Future<dynamic> put(String endpoint,
      {Map<String, String>? headers,
      Map<String, dynamic>? data,
      required Map<String, String> body}) async {
    // print("data : $data");
    // print("body : $body");
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers ?? {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
