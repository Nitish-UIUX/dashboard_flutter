

// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:login_singin/routes/app_routes.dart';
import 'package:login_singin/providers/user_provider.dart';
import 'auth/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize AuthService
  final authService = AuthService();
  final isLoggedIn = await authService.isLoggedIn();
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: UserLogin( isLoggedIn: isLoggedIn ),
    ),
  );
}

class UserLogin extends StatelessWidget {
  final bool isLoggedIn;
  const UserLogin({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:login_singin/routes/app_routes.dart';

// void main() {
//   runApp(const UserLogin());
// }

// class UserLogin extends StatelessWidget {
//   const UserLogin({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: router,
//       title: 'Admin Dashboard',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         useMaterial3: true,
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(UserLogin());
// }

// class UserLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   String _response = "API response will appear here";

//   // Function to call the API
//   Future<void> fetchProjects() async {
//     final url = Uri.parse('http://89.116.20.161:8002/api/v1/projects');
//     try {
//       final response = await http.get(url);

//       if (response.statusCode == 200) {
//         // Decode and update the response
//         setState(() {
//           _response = json.decode(response.body).toString();
//         });
//       } else {
//         setState(() {
//           _response = 'Error: ${response.statusCode}, ${response.reasonPhrase}';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _response = 'Error: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('API Call Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: fetchProjects,
//               child: Text('Fetch Projects'),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Text(
//                   _response,
//                   style: TextStyle(fontSize: 14, color: Colors.black),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }















// import 'package:flutter/material.dart';
// import 'package:login_singin/screens/login_screen.dart';

// void main() {
//   runApp(UserLogin());
// }

// class UserLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginScreen(),
//     );
//   }
// }