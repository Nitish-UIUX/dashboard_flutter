// import 'package:flutter/material.dart';

// class OrderInfoPage extends StatelessWidget {
//   final String orderId;

//   const OrderInfoPage({Key? key, required this.orderId}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // -----------------------------------------------Product Image and Details---------------------------
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: 150,
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/product_1.webp'),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Product Name',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Product Description goes here. It provides an overview of the product features.',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Price: \$99.99',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             // -----------------------------------------------Order Details----------------------------------------
//             SizedBox(height: 16),
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
//               child: Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(3),
//                 ),
//                 elevation: 2,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Status: Pending',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Payment Mode: COD',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Total: ₹ 20000',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'Date: 05/11/2024',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             OrderDetailsExpansionPanel(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // -----------------------------------------------Order Details Expansion Panel----------------------------------------

// class OrderDetailsExpansionPanel extends StatefulWidget {
//   const OrderDetailsExpansionPanel({Key? key}) : super(key: key);

//   @override
//   _OrderDetailsExpansionPanelState createState() =>
//       _OrderDetailsExpansionPanelState();
// }

// class _OrderDetailsExpansionPanelState
//     extends State<OrderDetailsExpansionPanel> {
//   bool _isShippingExpanded = false;
//   bool _isBillingExpanded = false;

//   void _toggleExpansion(int index) {
//     setState(() {
//       // If the clicked panel is already expanded, collapse both panels
//       if ((index == 0 && _isShippingExpanded) ||
//           (index == 1 && _isBillingExpanded)) {
//         _isShippingExpanded = false;
//         _isBillingExpanded = false;
//       } else {
//         // Close both panels before opening the selected one
//         _isShippingExpanded = false;
//         _isBillingExpanded = false;
//         if (index == 0) {
//           _isShippingExpanded = true;
//         } else if (index == 1) {
//           _isBillingExpanded = true;
//         }
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: ExpansionPanelList(
//         elevation: 1,
//         expandedHeaderPadding: EdgeInsets.zero,
//         expansionCallback: (int index, bool isExpanded) {
//           _toggleExpansion(index);
//         },
//         children: [
//           ExpansionPanel(
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return GestureDetector(
//                 onTap: () => _toggleExpansion(0),
//                 child: ListTile(
//                   title: Text('Shipping Info'),
//                 ),
//               );
//             },
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Shipping Address: 123 Main St, Springfield, USA',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: () => _toggleExpansion(0),
//                     child: Text('Toggle Shipping Info'),
//                   ),
//                 ],
//               ),
//             ),
//             isExpanded: _isShippingExpanded,
//           ),
//           ExpansionPanel(
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return GestureDetector(
//                 onTap: () => _toggleExpansion(1),
//                 child: ListTile(
//                   title: Text('Billing Info'),
//                 ),
//               );
//             },
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Billing Address: 456 Elm St, Springfield, USA',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                   SizedBox(height: 8),
//                   ElevatedButton(
//                     onPressed: () => _toggleExpansion(1),
//                     child: Text('Toggle Billing Info'),
//                   ),
//                 ],
//               ),
//             ),
//             isExpanded: _isBillingExpanded,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:login_singin/constants.dart';
import 'package:login_singin/controller/order_controller/order_details_controller.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class OrderInfoPage extends StatefulWidget {
  final String orderId;

  const OrderInfoPage({Key? key, required this.orderId}) : super(key: key);

  @override
  _OrderInfoPageState createState() => _OrderInfoPageState();
}

class _OrderInfoPageState extends State<OrderInfoPage> {
  final OrderDetailsController _orderDetailsController =
      OrderDetailsController();
  bool _isLoading = false;
  String? _errorMessage;
  dynamic _orderDetails;

  @override
  void initState() {
    super.initState();
    _fetchOrderDetails();
  }

//---------------------------------------------------------fetchOrderDetails--------------------------------------------------
  Future<void> _fetchOrderDetails() async {
    setState(() {
      // Show a loading indicator while fetching order details
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      print('Order ID: ${widget.orderId}');
      final response =
          await _orderDetailsController.fetchOrderDetails(widget.orderId);
      print('Order Details Response: $response');
      setState(() {
        _orderDetails = response;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching order details: $e');
      setState(() {
        _errorMessage = 'Error fetching order details: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(child: Text(_errorMessage!));
    }

    final product = _orderDetails?['orderItems']?[0]?['product'];
    final shippingAddress = _orderDetails;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          '$baseUrl/uploads/products/thumbnails/Thumb-${product?['productImages']?[0]?['image'] ?? ''}',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product?['title'] ?? 'N/A',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        HtmlWidget(
                          product?['short_description'] ?? 'N/A',
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '₹${product?['price'] ?? '0.00'}', // Display only the price amount
                          style: TextStyle(
                            fontSize: 20, // Adjust the size of the price
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text:
                                '₹${product?['compare_price'] ?? '0.00'}', // Display the compare price amount
                            style: TextStyle(
                              fontSize:
                                  12, // Adjust the font size for compare price
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration
                                  .lineThrough, // Strikethrough the compare price
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Status: ${shippingAddress?['status'] ?? 'N/A'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Payment Mode: ${shippingAddress?['payment_method'] ?? 'N/A'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Total: ₹${shippingAddress?['total'] ?? '0.00'}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Date: ${_formatDate(shippingAddress?['created_at'] ?? 'N/A')}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              OrderDetailsExpansionPanel(orderDetails: _orderDetails),
            ],
          ),
        ),
      ),
    );
  }
}

//  ------------------------------------------------Order Details Expansion Panel------------------------------------------------
class OrderDetailsExpansionPanel extends StatefulWidget {
  final dynamic orderDetails;

  const OrderDetailsExpansionPanel({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  _OrderDetailsExpansionPanelState createState() =>
      _OrderDetailsExpansionPanelState();
}

class _OrderDetailsExpansionPanelState
    extends State<OrderDetailsExpansionPanel> {
  bool _isShippingExpanded = false;
  bool _isBillingExpanded = false;

  void _toggleExpansion(int index) {
    setState(() {
      if ((index == 0 && _isShippingExpanded) ||
          (index == 1 && _isBillingExpanded)) {
        _isShippingExpanded = false;
        _isBillingExpanded = false;
      } else {
        _isShippingExpanded = false;
        _isBillingExpanded = false;
        if (index == 0) {
          _isShippingExpanded = true;
        } else if (index == 1) {
          _isBillingExpanded = true;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final billingAddress = widget.orderDetails?['billingAddress'];
    final shippingAddress = widget.orderDetails;

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          _toggleExpansion(index);
        },
        children: [
          // ---------------------------Shipping Info Panel-------------------------
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return GestureDetector(
                onTap: () => _toggleExpansion(0),
                child: ListTile(
                  title: Text('Shipping Details', style: TextStyle(fontSize: 18)),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${shippingAddress?['first_name']} ${shippingAddress?['last_name']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${shippingAddress?['email']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone: ${shippingAddress?['phone']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Address: ${shippingAddress?['address']}, ${shippingAddress?['city']}, ${shippingAddress?['state']} - ${shippingAddress?['zip']}, ${shippingAddress?['country']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            isExpanded: _isShippingExpanded,
          ),

          // ----------------------------------------------Billing Info Panel----------------------------------
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return GestureDetector(
                onTap: () => _toggleExpansion(1),
                child: ListTile(
                  title: Text('Billing Details', style: TextStyle(fontSize: 16)),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${billingAddress?['first_name']} ${billingAddress?['last_name']}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Email: ${billingAddress?['email']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Phone: ${billingAddress?['phone']}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Address: ${billingAddress?['address']}, ${billingAddress?['city']}, ${billingAddress?['state']} - ${billingAddress?['zip']}, ${billingAddress?['country']}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            isExpanded: _isBillingExpanded,
          ),
        ],
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
