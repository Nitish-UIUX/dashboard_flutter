// import 'package:flutter/material.dart';

// class OrderDetails extends StatefulWidget {
//   final String id;

//   OrderDetails({Key? key, required this.id}) : super(key: key);

//   @override
//   _OrderDetailsState createState() => _OrderDetailsState();
// }

// class _OrderDetailsState extends State<OrderDetails>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   bool _isShippingExpanded = false;
//   bool _isBillingExpanded = false;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//   }

//   void _toggleExpansion(int index) {
//     setState(() {
//       // If the clicked panel is already expanded, collapse both panels
//       if ((index == 0 && _isShippingExpanded) || (index == 1 && _isBillingExpanded)) {
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
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Details'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'Order Info'),
//             Tab(text: 'Admin Actions'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // Order Info Tab
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   // Product Image and Details
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 150,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.0),
//                           image: DecorationImage(
//                             image: AssetImage('assets/images/product_1.webp'),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 16),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Product Name',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Product Description goes here. It provides an overview of the product features.',
//                               style: TextStyle(fontSize: 14),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Price: \$99.99',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   Container(
//                     width: double.infinity,
//                     margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(3),
//                       ),
//                       elevation: 2,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Status: Pending',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Payment Mod: COD',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Total: ₹ 20000',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                             SizedBox(height: 8),
//                             Text(
//                               'Date: 05/11/2024',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: ExpansionPanelList(
//                       elevation: 1,
//                       expandedHeaderPadding: EdgeInsets.zero,
//                       expansionCallback: (int index, bool isExpanded) {
//                         _toggleExpansion(index);
//                       },
//                       children: [
//                         ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return GestureDetector(
//                               onTap: () => _toggleExpansion(0),
//                               child: ListTile(
//                                 title: Text('Shipping Info'),
//                               ),
//                             );
//                           },
//                           body: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Shipping Address: 123 Main St, Springfield, USA',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 SizedBox(height: 8),
//                                 ElevatedButton(
//                                   onPressed: () => _toggleExpansion(0),
//                                   child: Text('Toggle Shipping Info'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           isExpanded: _isShippingExpanded,
//                         ),
//                         ExpansionPanel(
//                           headerBuilder: (BuildContext context, bool isExpanded) {
//                             return GestureDetector(
//                               onTap: () => _toggleExpansion(1),
//                               child: ListTile(
//                                 title: Text('Billing Info'),
//                               ),
//                             );
//                           },
//                           body: Padding(
//                             padding: const EdgeInsets.all(16.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Billing Address: 456 Elm St, Springfield, USA',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 SizedBox(height: 8),
//                                 ElevatedButton(
//                                   onPressed: () => _toggleExpansion(1),
//                                   child: Text('Toggle Billing Info'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           isExpanded: _isBillingExpanded,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Admin Actions Tab
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Admin Actions',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Text('Admin action section here.'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'Widgets/admin_actions_page.dart';
import 'Widgets/order_info_page.dart';

class OrderDetails extends StatefulWidget {
  final String id;

  const OrderDetails({Key? key, required this.id}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Order Info'),
            Tab(text: 'Admin Actions'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          OrderInfoPage(orderId: widget.id),
          AdminActionsPage(orderId: widget.id),
        ],
      ),
    );
  }
}
