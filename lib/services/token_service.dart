import 'dart:convert';
import 'dart:core';

class TokenService {
  static bool isTokenExpired(String? token) {
    if (token == null) return true;
    try {
      // Decode the JWT token
      final parts = token.split('.');
      if (parts.length != 3) return true;
      final payload = json.decode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
      );
      // Check expiration
      final exp = payload['exp'];
      if (exp == null) return true;
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      return currentTime >= exp;
    } catch (e) {
      return true;
    }
  }

  // Optional: Additional methods for token parsing
  static Map<String, dynamic> decodeToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) throw FormatException('Invalid token');
      
      final payload = json.decode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1])))
      );
      return payload;
    } catch (e) {
      return {};
    }
  }

  // Optional: Get remaining token validity
  static Duration? getRemainingValidity(String token) {
    try {
      final payload = decodeToken(token);
      final exp = payload['exp'];
      if (exp == null) return null;

      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final remainingSeconds = exp - currentTime;

      return Duration(seconds: remainingSeconds.toInt());
    } catch (e) {
      return null;
    }
  }
}