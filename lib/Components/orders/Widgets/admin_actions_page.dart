import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:login_singin/controller/order_controller/order_details_controller.dart';

class AdminActionsPage extends StatefulWidget {
  final String orderId;
  const AdminActionsPage({Key? key, required this.orderId}) : super(key: key);

  @override
  State<AdminActionsPage> createState() => _AdminActionsPageState();
}

class _AdminActionsPageState extends State<AdminActionsPage> {
  final OrderDetailsController _controller = OrderDetailsController();
  final TextEditingController _adminNotesController = TextEditingController();
  final List<String> orderStatusItems = [
    "pending",
    "processing",
    "confirmed",
    "shipped",
    "delivered",
    "cancelled",
  ];
  final List<String> recipientItems = [
    "Customer",
    "Admin",
  ];

  String? selectedStatus;
  String? selectedRecipient = 'Customer';
  bool isLoading = true;
  bool isMailSending = false;
  String? errorMessage;
  String? mailErrorMessage;
  String? adminNotes;

  @override
  void initState() {
    super.initState();
    _fetchSingleOrder();
  }

  @override
  void dispose() {
    _adminNotesController.dispose();
    super.dispose();
  }

  //-------------------------------------------------------------------fetchSingleOrder--------------------------------------------------

  Future<void> _fetchSingleOrder() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      final orderDetails = await _controller.fetchOrderDetails(widget.orderId);

      setState(() {
        // Get the status from API response and handle possible nested response
        final status = orderDetails is Map
            ? (orderDetails['data']?['status'] ?? orderDetails['status'])
            : null;

        // extract admin notes for show in text field for updateAdminNotes
        final notes = orderDetails is Map
            ? (orderDetails['data']?['admin_notes'] ??
                orderDetails['admin_notes'])
            : null;

        if (notes != null) {
          adminNotes = notes;
          _adminNotesController.text = notes;
        }

        // Check if the API status exists in our dropdown items
        if (status != null) {
          final matchingStatus = orderStatusItems.firstWhere(
            (item) => item.toLowerCase() == status.toString().toLowerCase(),
            orElse: () => '',
          );
          selectedStatus = matchingStatus.isEmpty ? null : matchingStatus;
        }

        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load order details: $e';
        isLoading = false;
      });
      debugPrint('Error in _fetchSingleOrder: $e');
    }
  }

  //-------------------------------------------------------------------updateOrderStatus--------------------------------------------------
  Future<void> _updateOrderStatus() async {
    print('Order status updated to: $selectedStatus');
    if (selectedStatus == null) return;

    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Call the controller's updateOrder method
      final response = await _controller.updateOrder(
        widget.orderId,
        selectedStatus!.toLowerCase(),
      );

      // Show success message
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Order status updated successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Refresh the order details
      await _fetchSingleOrder();
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to update order status: $e';
        isLoading = false;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update order status: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
      debugPrint('Error in _updateOrderStatus: $e');
    }
  }

  //-------------------------------------------------------------------sendInvoiceMail--------------------------------------------------
  Future<void> _sendInvoiceMail() async {
    if (selectedRecipient == null) {
      debugPrint('Recipient is not selected.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a recipient.'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    debugPrint('Sending invoice mail to: $selectedRecipient');

    try {
      // Indicate that the mail is being sent
      setState(() {
        isMailSending = true;
        mailErrorMessage = null;
      });

      // Call the controller's sendMail method
      final response = await _controller.sendMail(
        widget.orderId,
        selectedRecipient!.toLowerCase(),
      );

      debugPrint('Mail response: $response');

      if (!mounted) return;

      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invoice mail sent successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      debugPrint('Error in _sendInvoiceMail: $e');

      // Update error message in the state
      setState(() {
        mailErrorMessage = 'Failed to send invoice mail: $e';
      });

      if (!mounted) return;

      // Display error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send invoice mail: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    } finally {
      // Reset sending state
      if (mounted) {
        setState(() {
          isMailSending = false;
        });
      }
    }
  }

// -------------------------------------------------------------------updateAdminNotes--------------------------------------------------

  Future<void> _updateAdminNotes() async {
    print('Admin notes updated to: $adminNotes');
    if (adminNotes == null) return;

    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Call the controller's updateAdminNotes method
      final response = await _controller.updateAdminNotes(
        widget.orderId,
        adminNotes!,
      );

      // Show success message
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Admin notes updated successfully'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      // Refresh the order details
      await _fetchSingleOrder();
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to update admin notes: $e';
        isLoading = false;
      });

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update admin notes: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
      debugPrint('Error in _updateAdminNotes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Order Status Block
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Update Order Status',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      )
                    else
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Select Status',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          items: orderStatusItems
                              .map((String status) => DropdownMenuItem<String>(
                                    value: status,
                                    child: Text(
                                      status,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedStatus,
                          onChanged: (String? value) {
                            setState(() {
                              selectedStatus = value;
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey),
                              color: Colors.white,
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.black),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 14),
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading || selectedStatus == null
                            ? null
                            : _updateOrderStatus,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'UPDATE ORDER',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Invoice Mail Block
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Send Invoice Mail',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (mailErrorMessage != null)
                      Text(
                        mailErrorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select Recipient',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        items: recipientItems
                            .map((String recipient) => DropdownMenuItem<String>(
                                  value: recipient,
                                  child: Text(
                                    recipient,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedRecipient,
                        onChanged: (String? value) {
                          setState(() {
                            selectedRecipient = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                        ),
                        iconStyleData: const IconStyleData(
                          icon:
                              Icon(Icons.arrow_drop_down, color: Colors.black),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 50,
                          padding: EdgeInsets.symmetric(horizontal: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isMailSending || selectedRecipient == null
                            ? null
                            : _sendInvoiceMail,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: isMailSending
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'SEND MAIL',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Admin Notes Block
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Update Admin Notes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (errorMessage != null)
                      Text(
                        errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      )
                    else
                      TextField(
                        controller: _adminNotesController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Enter admin notes',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          setState(() {
                            adminNotes = value;
                          });
                        },
                      ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading || adminNotes == null
                            ? null
                            : _updateAdminNotes,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          disabledBackgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'SAVE NOTES',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Added bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
