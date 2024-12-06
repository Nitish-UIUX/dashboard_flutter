
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_singin/constants.dart';
import 'package:login_singin/controller/order_controller/order_controller.dart';


class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final OrderController _orderController = OrderController();
  dynamic _response;
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchOrders();
  }


// ------------------------------------------------------fetch the order details--------------------------------------------------------------
  Future<void> _fetchOrders() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await _orderController.fetchOrders();
      
      setState(() {
        _response = response;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch orders. Please try again later.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.filter_list, size: 20),
              label: const Text('Filter'),
              onPressed: _fetchOrders,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: OutlinedButton.icon(
              icon: const Icon(Icons.sort, size: 20),
              label: const Text('Sort'),
              onPressed: _fetchOrders,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _fetchOrders,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _response != null
                  ? ListView.builder(
                      itemCount: _response.length,
                      itemBuilder: (context, index) {
                        final order = _response[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border(
                                left: BorderSide(
                                  color: Colors.blue,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          order['user']['profile_image'] != null
                                              ? NetworkImage(
                                                  '$baseUrl/uploads/users/thumb/Thumb-${order['user']['profile_image']}',
                                                )
                                              : null,
                                      child:
                                          order['user']['profile_image'] == null
                                              ? Icon(Icons.person)
                                              : null,
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            order['user']['name'] ??
                                                'Unknown User',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            order['user']['email'] ??
                                                'No email',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                    OutlinedButton(
                                      onPressed: () {
                                        context.go('/orders/${order['id']}');
                                      },
                                      child: Text(
                                        'View Order',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 20, color: Colors.grey[300]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order ID: ${order['id']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: _getStatusColor(order['status']),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        'Status: ${order['status']}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      '₹${order['total']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Payment: ${order['payment_method']}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Date: ${_formatDate(order['created_at'] ?? '')}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No orders found.'),
                    ),
    );
  }
}

// Helper method to format date
String _formatDate(String dateString) {
  try {
    DateTime dateTime = DateTime.parse(dateString);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  } catch (e) {
    return dateString;
  }
}

// Helper method to get status color
Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'processing':
      return const Color.fromARGB(255, 23, 132, 183);
    case 'delivered':
      return Colors.green;
    case 'cancelled':
      return const Color.fromARGB(255, 217, 43, 13);
    case 'pending':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}














// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:login_singin/auth/auth_service.dart';
// import 'package:login_singin/constants.dart';
// import 'package:login_singin/services/api_service.dart';

// class Orders extends StatefulWidget {
//   const Orders({super.key});

//   @override
//   State<Orders> createState() => _OrdersState();
// }

// class _OrdersState extends State<Orders> {
//   String? _token;
//   dynamic _response;
//   bool _isLoading = true;
//   String? _errorMessage;

//   @override
//   void initState() {
//     super.initState();
//     _fetchOrders();
//   }

//   // ------------------------------------------------------fetch the order details--------------------------------------------------------------

//   Future<void> _fetchOrders() async {
//     final authService = AuthService();

//     try {
//       // Get the authentication token
//       final token = await authService.getToken();

//       if (token == null) {
//         throw Exception('Authentication token not found.');
//       }

//       setState(() {
//         _token = token;
//         _isLoading = true;
//         _errorMessage = null;
//       });

//       // Prepare headers with the token
//       final headers = {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token'
//       };

//       // Make the API call
//       final response = await ApiService.get('/admin/orders', headers: headers);

//       setState(() {
//         _response = response;
//         _isLoading = false;
//       });

//       // Log the token and response
//       debugPrint('Token: $token');
//       debugPrint('Response: ${response.toString()}');
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Failed to fetch orders. Please try again later.';
//         _isLoading = false;
//       });

//       // Log the error for debugging
//       debugPrint('Error: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ------------------------------------------------------app bar--------------------------------------------------------------
//       appBar: AppBar(
//         title: const Text('Orders'),
//         actions: [
//           Padding(
//             padding:
//                 const EdgeInsets.only(right: 10.0), // Space between the buttons
//             child: OutlinedButton.icon(
//               icon: const Icon(Icons.filter_list, size: 20),
//               label: const Text('Filter'),
//               onPressed: _fetchOrders,
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.only(right: 15), // Space between the buttons
//             child: OutlinedButton.icon(
//               icon: const Icon(Icons.sort, size: 20),
//               label: const Text('Sort'),
//               onPressed: _fetchOrders,
//               style: OutlinedButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _errorMessage != null
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         _errorMessage!,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.red),
//                       ),
//                       const SizedBox(height: 16),
//                       ElevatedButton(
//                         onPressed: _fetchOrders,
//                         child: const Text('Retry'),
//                       ),
//                     ],
//                   ),
//                 )
//               : _response != null
//                   ? ListView.builder(
//                       itemCount: _response.length,
//                       itemBuilder: (context, index) {
//                         final order = _response[index];
//                         return Card(
//                           margin: const EdgeInsets.symmetric(
//                               horizontal: 6, vertical: 6),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border(
//                                 left: BorderSide(
//                                   color: Colors.blue, // Left border color
//                                   width: 3.0, // Left border width
//                                 ),
//                               ),
//                             ),
//                             padding: const EdgeInsets.all(4.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // ---------------------------------User Profile Section-------------------------------
//                                 Row(
//                                   children: [
//                                     // Profile Image
//                                     CircleAvatar(
//                                       radius: 30,
//                                       backgroundImage:
//                                           order['user']['profile_image'] != null
//                                               ? NetworkImage(
//                                                   '$baseUrl/uploads/users/thumb/Thumb-${order['user']['profile_image']}',
//                                                 )
//                                               : null,
//                                       child:
//                                           order['user']['profile_image'] == null
//                                               ? Icon(Icons.person)
//                                               : null,
//                                     ),
//                                     SizedBox(width: 10),

//                                     // User Details Column wrapped in Flexible
//                                     Expanded(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceEvenly,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             order['user']['name'] ??
//                                                 'Unknown User',
//                                             style: TextStyle(
//                                               fontSize: 16,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                             overflow: TextOverflow
//                                                 .ellipsis, // Prevents overflow and adds "..."
//                                           ),
//                                           Text(
//                                             order['user']['email'] ??
//                                                 'No email',
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                               color: Colors.grey,
//                                             ),
//                                             overflow: TextOverflow
//                                                 .ellipsis, // Prevents overflow for long emails
//                                           ),
//                                         ],
//                                       ),
//                                     ),

//                                     // Button aligned to the right
//                                     OutlinedButton(
//                                       onPressed: () {
//                                         context.go('/orders/${order['id']}');
//                                       },
//                                       child: Text(
//                                         'View Order',
//                                         style: TextStyle(fontSize: 12),
//                                       ),
//                                     ),
//                                   ],
//                                 ),

//                                 Divider(height: 20, color: Colors.grey[300]),

//                                 //--------------------------------------- Order Details------------------------------------
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Order ID: ${order['id']}',
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Container(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 8, vertical: 4),
//                                       decoration: BoxDecoration(
//                                         color: _getStatusColor(order['status']),
//                                         borderRadius: BorderRadius.circular(4),
//                                       ),
//                                       child: Text(
//                                         'Status: ${order['status']}',
//                                         style: const TextStyle(
//                                           fontSize: 12,
//                                           color: Colors.white,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),

//                                 // Financial Details
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Total Amount',
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                     Text(
//                                       '₹${order['total']}',
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.green,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),

//                                 // Payment and Date Details
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Payment: ${order['payment_method']}',
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                     Text(
//                                       'Date: ${_formatDate(order['created_at'] ?? '')}',
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   : const Center(
//                       child: Text('No orders found.'),
//                     ),
//     );
//   }
// }

// // Helper method to format date
// String _formatDate(String dateString) {
//   try {
//     DateTime dateTime = DateTime.parse(dateString);
//     return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
//   } catch (e) {
//     return dateString;
//   }
// }

// // Helper method to get status color
// Color _getStatusColor(String status) {
//   switch (status.toLowerCase()) {
//     case 'processing':
//       return const Color.fromARGB(255, 23, 132, 183);
//     case 'delivered':
//       return Colors.green;
//     case 'cancelled':
//       return const Color.fromARGB(255, 217, 43, 13);
//     case 'pending':
//       return Colors.orange;
//     default:
//       return Colors.grey;
//   }
// }