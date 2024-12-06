// app_routes.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:login_singin/Components/support/help&support.dart';
import 'package:login_singin/Components/orders/orderDetails.dart';
import 'package:login_singin/Components/support/setting.dart';
import 'package:login_singin/screens/login_screen.dart';
import 'package:login_singin/Components/mainLayout.dart';
import 'package:login_singin/Components/dashboard/dashboard.dart';
import 'package:login_singin/Components/products/products.dart';
import 'package:login_singin/Components/orders/orders.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final bool isLoggedIn = userProvider.user != null;

    if (!isLoggedIn && !state.matchedLocation.startsWith('/login')) {
      return '/login';
    }
    if (isLoggedIn && state.matchedLocation.startsWith('/login')) {
      return '/';
    }
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return Mainlayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => Dashboard(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => Products(),
        ),
        GoRoute(
          path: '/orders',
          builder: (context, state) => Orders(),
          routes: [
            GoRoute(
              path: ':id', // Nested route for order details
              builder: (context, state) {
                final orderId =
                    state.pathParameters['id']; // Use pathParameters
                return OrderDetails(
                    id: orderId!); // Pass it to the Orderdetails page
              },
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const Setting(),
        ),
        GoRoute(
          path: '/support',
          builder: (context, state) => const HelpPage(),
        ),
      ],
    ),
  ],
);
