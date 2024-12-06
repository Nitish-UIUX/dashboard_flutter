// import 'package:flutter/material.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// class Mainlayout extends StatefulWidget {
//   @override
//   _MainlayoutState createState() => _MainlayoutState();
// }

// class _MainlayoutState extends State<Mainlayout> {
//   bool _isDarkMode = false;

//   Color getBackgroundColor() => _isDarkMode ? Colors.black87 : Colors.white;
//   Color getCardColor() => _isDarkMode ? Colors.grey[800]! : Colors.white;
//   Color getTextColor() => _isDarkMode ? Colors.white : Colors.black;

//   //  ------------------------------------------------  buildStatCard  ------------------------------------------------

//   Widget buildStatCard(String title, String value) {
//     return Expanded(
//       child: Card(
//         color: getCardColor(),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: TextStyle(color: getTextColor(), fontSize: 16.0),
//               ),
//               const SizedBox(height: 20.0),
//               Text(
//                 value,
//                 style: TextStyle(color: getTextColor(), fontSize: 16.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // ------------------------------------------------  AppBar  ------------------------------------------------
//       appBar: AppBar(
//         backgroundColor: _isDarkMode
//             ? const Color.fromARGB(84, 78, 79, 80)
//             : Colors.blueAccent,
//         title: const Text(
//           'Admin Dashboard',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon:
//                 const Icon(Icons.menu, color: Colors.white), // Menu icon in red
//             onPressed: () {
//               Scaffold.of(context).openDrawer(); // Open the drawer
//             },
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               _isDarkMode ? LucideIcons.sun : LucideIcons.moon,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isDarkMode = !_isDarkMode;
//               });
//             },
//           ),
//           IconButton(
//             icon: const Icon(LucideIcons.bell, color: Colors.white),
//             onPressed: () {
//               // Handle notification icon press
//             },
//           ),
//           IconButton(
//             icon: const Icon(LucideIcons.user, color: Colors.white),
//             onPressed: () {
//               // Handle profile icon press
//             },
//           ),
//         ],
//       ),

//       // ------------------------------------------------  Drawer  ------------------------------------------------
//       drawer: SafeArea(
//         child: Drawer(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: _isDarkMode ? Colors.black87 : Colors.blueAccent,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage('assets/images/nitish.png'),
//                         radius: 40, // Profile image
//                       ),

//                       SizedBox(height: 1),
//                       Text(
//                         'Nitish Kumar',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       // SizedBox(height: 4),
//                       Text(
//                         'niteshdto18@gmail.com',
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               // Navigate to the profile page
//                               print('Navigate to profile page');
//                             },
//                             child: Text(
//                               'View Profile',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               // Implement logout functionality
//                               print('Logout clicked');
//                             },
//                             child: IconButton(
//                               icon: Icon(Icons.logout, color: Colors.white),
//                               onPressed: () {
//                                 // Implement logout functionality
//                                 print('Logout clicked');
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // ------------------------------------------------  Drawer List  ------------------------------------------------
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       leading: const Icon(LucideIcons.home),
//                       title: const Text('Dashboard'),
//                       onTap: () {
//                         // Navigate to the dashboard page
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(LucideIcons.box),
//                       title: const Text('Products'),
//                       onTap: () {
//                         // Navigate to the product management page
//                       },
//                     ),

//                     ListTile(
//                       leading: const Icon(LucideIcons.shoppingCart),
//                       title: const Text('Orders'),
//                       onTap: () {
//                         // Navigate to the user management page
//                       },
//                     )
//                     // Add more list tiles as needed
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // ------------------------------------------------  Body  ------------------------------------------------
//       body: Container(
//         color: getBackgroundColor(),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Dashboard',
//               style: TextStyle(
//                 color: getTextColor(),
//                 fontSize: 24.0,
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 buildStatCard('Total Sales', '\$100,000'),
//                 const SizedBox(width: 16.0),
//                 buildStatCard('New Orders', '50'),
//               ],
//             ),
//             const SizedBox(height: 16.0),
//             Row(
//               children: [
//                 buildStatCard('Active Users', '1,200'),
//                 const SizedBox(width: 16.0),
//                 buildStatCard('Pending Orders', '25'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:login_singin/auth/auth_service.dart';
// import 'package:login_singin/dashboard/Products.dart';
// import 'package:login_singin/dashboard/dashboard.dart';
// import 'package:login_singin/dashboard/orders.dart';
// import 'package:login_singin/screens/login_screen.dart';
// import 'package:lucide_icons/lucide_icons.dart';

// class Mainlayout extends StatefulWidget {
//   @override
//   _MainlayoutState createState() => _MainlayoutState();
// }

// class _MainlayoutState extends State<Mainlayout> {
//   bool _isDarkMode = false;
//   int _selectedIndex = 0; // Track selected navigation item
//   final AuthService _authService = AuthService();

//   Color getBackgroundColor() => _isDarkMode ? Colors.black87 : Colors.white;
//   Color getCardColor() => _isDarkMode ? Colors.grey[800]! : Colors.white;
//   Color getTextColor() => _isDarkMode ? Colors.white : Colors.black;

//   // --------------------------------------------------------------- logout ---------------------------------------------------------------
//   Future<void> _handleLogout() async {
//     try {
//       // Show loading dialog
//       showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       );

//       // Clear all authentication data
//       await _authService.logout();

//       // Add a 2-second delay
//       await Future.delayed(Duration(seconds: 2));

//       // Remove loading dialog
//       Navigator.pop(context);

//       // Show success message
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Center(
//         child: Text(
//           'Logout successful',
//           style: TextStyle(color: Colors.green),
//         ),
//           ),
//         ),
//       );

//       // Navigate to login screen and clear navigation stack
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//         (route) => false,
//       );
//     } catch (e) {
//       // Remove loading dialog if there's an error
//       Navigator.pop(context);

//       // Show error message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Logout failed: ${e.toString()}')),
//       );
//     }
//   }

//   // -----------------------------Add pages for navigation----------------------
//   final List<Widget> _pages = [
//     Dashboard(),
//     Products(),
//     Orders(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: _isDarkMode
//             ? const Color.fromARGB(84, 78, 79, 80)
//             : Colors.blueAccent,
//         title: const Text(
//           'Admin Dashboard',
//           style: TextStyle(color: Colors.white),
//         ),
//         leading: Builder(
//           builder: (context) => IconButton(
//             icon: const Icon(Icons.menu, color: Colors.white),
//             onPressed: () {
//               Scaffold.of(context).openDrawer();
//             },
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               _isDarkMode ? LucideIcons.sun : LucideIcons.moon,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               setState(() {
//                 _isDarkMode = !_isDarkMode;
//               });
//             },
//           ),
//           IconButton(
//             icon: const Icon(LucideIcons.bell, color: Colors.white),
//             onPressed: () {
//               // Handle notification icon press
//             },
//           ),
//           IconButton(
//             icon: const Icon(LucideIcons.user, color: Colors.white),
//             onPressed: () {
//               // Handle profile icon press
//             },
//           ),
//         ],
//       ),

//       // ---------------------------------------------------------------------------------Drawer----------------------------------------------------------------------
//       drawer: SafeArea(
//         child: Drawer(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: _isDarkMode ? Colors.black87 : Colors.blueAccent,
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage('assets/images/nitish.png'),
//                         radius: 40,
//                       ),
//                       SizedBox(height: 1),
//                       Text(
//                         'Nitish Kumar',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         'niteshdto18@gmail.com',
//                         style: TextStyle(
//                           color: Colors.white70,
//                           fontSize: 14,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               print('Navigate to profile page');
//                             },
//                             child: Text(
//                               'View Profile',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: _handleLogout, // Update this
//                             child: IconButton(
//                               icon: Icon(Icons.logout, color: Colors.white),
//                               onPressed: _handleLogout, // Update this
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               // ------------------------------------------------  Drawer List  ------------------------------------------------
//               Expanded(
//                 child: ListView(
//                   children: [
//                     ListTile(
//                       leading: const Icon(LucideIcons.home),
//                       title: const Text('Dashboard'),
//                       selected: _selectedIndex == 0,
//                       selectedTileColor: Colors.blue.withOpacity(0.1),
//                       onTap: () {
//                         setState(() {
//                           _selectedIndex = 0;
//                         });
//                         Navigator.pop(context); // Close drawer
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(LucideIcons.box),
//                       title: const Text('Products'),
//                       selected: _selectedIndex == 1,
//                       selectedTileColor: Colors.blue.withOpacity(0.1),
//                       onTap: () {
//                         setState(() {
//                           _selectedIndex = 1;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                     ListTile(
//                       leading: const Icon(LucideIcons.shoppingCart),
//                       title: const Text('Orders'),
//                       selected: _selectedIndex == 2,
//                       selectedTileColor: Colors.blue.withOpacity(0.1),
//                       onTap: () {
//                         setState(() {
//                           _selectedIndex = 2;
//                         });
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Container(
//         color: getBackgroundColor(),
//         child: _pages[_selectedIndex], // Show selected page
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_singin/auth/auth_service.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class Mainlayout extends StatefulWidget {
  final Widget child;

  const Mainlayout({super.key, required this.child});

  @override
  _MainlayoutState createState() => _MainlayoutState();
}

class _MainlayoutState extends State<Mainlayout> {
  bool _isDarkMode = false;
  final AuthService _authService = AuthService();

  // Theme helper methods
  Color getBackgroundColor() => _isDarkMode ? Colors.black87 : Colors.white;
  Color getCardColor() => _isDarkMode ? Colors.grey[800]! : Colors.white;
  Color getTextColor() => _isDarkMode ? Colors.white : Colors.black;

  // -----------------------------------Logout handler------------------------------
  Future<void> _handleLogout() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      await _authService.logout();

      // Clear user data from provider
      Provider.of<UserProvider>(context, listen: false).clearUser();

      // Add a delay for better UX
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      Navigator.pop(context); // Remove loading dialog

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Center(
            child: Text(
              'Logout successful',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ),
      );

      context.go('/login');
    } catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.toString()}')),
      );
    }
  }

//-----------------------------------Drawer-----------------------------------
  @override
  Widget build(BuildContext context) {
    final currentRoute =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isDarkMode
            ? const Color.fromARGB(84, 78, 79, 80)
            : Colors.blueAccent,
        title: Text(
          _getPageTitle(currentRoute),
          style: const TextStyle(color: Colors.white),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isDarkMode ? LucideIcons.sun : LucideIcons.moon,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.white),
            onPressed: () {
              // Handle notifications
              _showNotificationsDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(LucideIcons.user, color: Colors.white),
            onPressed: () {
              // Handle profile
              _showProfileDialog(context);
            },
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: _isDarkMode ? Colors.black87 : Colors.blueAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: Provider.of<UserProvider>(context)
                                    .user
                                    ?.profileImage !=
                                null
                            ? NetworkImage(Provider.of<UserProvider>(context)
                                .user!
                                .profileImage!)
                            : const AssetImage('assets/images/nitish.png')
                                as ImageProvider,
                        radius: 40,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        Provider.of<UserProvider>(context).user?.name ?? 'User',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        Provider.of<UserProvider>(context).user?.email ?? '',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              context.push('/profile');
                            },
                            child: const Text(
                              'View Profile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout, color: Colors.white),
                            onPressed: _handleLogout,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: getBackgroundColor(),
                  child: ListView(
                    children: [
                      _buildDrawerItem(
                        context,
                        icon: LucideIcons.home,
                        title: 'Dashboard',
                        route: '/',
                        currentRoute: currentRoute,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: LucideIcons.box,
                        title: 'Products',
                        route: '/products',
                        currentRoute: currentRoute,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: LucideIcons.shoppingCart,
                        title: 'Orders',
                        route: '/orders',
                        currentRoute: currentRoute,
                      ),
                      const Divider(),
                      _buildDrawerItem(
                        context,
                        icon: LucideIcons.settings,
                        title: 'Settings',
                        route: '/settings',
                        currentRoute: currentRoute,
                      ),
                      _buildDrawerItem(
                        context,
                        icon: LucideIcons.helpCircle,
                        title: 'Help & Support',
                        route: '/support',
                        currentRoute: currentRoute,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: getBackgroundColor(),
        child: widget.child,
      ),
    );
  }

  //------------------------- Helper method to build drawer items-------------------
  Widget _buildDrawerItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String route,
    required String currentRoute,
  }) {
    final isSelected = currentRoute == route;

    return ListTile(
      leading: Icon(
        icon,
        color: isSelected
            ? Colors.blue
            : _isDarkMode
                ? Colors.white
                : Colors.black87,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected
              ? Colors.blue
              : _isDarkMode
                  ? Colors.white
                  : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.blue.withOpacity(0.1),
      onTap: () {
        context.go(route);
        Navigator.pop(context); // Close drawer
      },
    );
  }

  //------------------------ Helper method to get page title based on current route---------------
  String _getPageTitle(String route) {
    switch (route) {
      case '/dashboard':
        return 'Dashboard';
      case '/products':
        return 'Products';
      case '/orders':
        return 'Orders';
      case '/settings':
        return 'Settings';
      case '/support':
        return 'Help & Support';
      default:
        return 'Admin Dashboard';
    }
  }

  // -----------------------------------Notification dialog-------------------------
  void _showNotificationsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notifications'),
          content: const SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('No new notifications'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // ----------------------------------Profile dialog-----------------------
  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Profile Options'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(LucideIcons.user),
                title: Text('View Profile'),
              ),
              ListTile(
                leading: Icon(LucideIcons.settings),
                title: Text('Account Settings'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}




























// import 'package:flutter/material.dart';

// class Dashboard extends StatelessWidget {
//   const Dashboard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Center(
//         child: Text('Welcome to the Dashboard!'),
//       ),
//     );
//   }
// }





























































































































// import 'package:flutter/material.dart';

// class Dashboard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth < 768) {
//           // Mobile layout
//           return MobileLayout();
//         } else {
//           // Desktop layout
//           return DesktopLayout();
//         }
//       },
//     );
//   }
// }

// class MobileLayout extends StatefulWidget {
//   @override
//   _MobileLayoutState createState() => _MobileLayoutState();
// }

// class _MobileLayoutState extends State<MobileLayout> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       drawer: Drawer(
//         child: Sidebar(),
//       ),
//       appBar: AppBar(
//         title: Text('Dashboard'),
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             _scaffoldKey.currentState?.openDrawer();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: DashboardContent(),
//       ),
//     );
//   }
// }

// class DesktopLayout extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           Sidebar(),
//           Expanded(
//             child: Column(
//               children: [
//                 TopBar(),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: DashboardContent(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Sidebar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200,
//       color: Colors.blue,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 16),
//           ListTile(
//             title: Text('Dashboard', style: TextStyle(color: Colors.white)),
//             onTap: () {
//               // Navigate to Dashboard
//             },
//           ),
//           ListTile(
//             title: Text('Products', style: TextStyle(color: Colors.white)),
//             onTap: () {
//               // Navigate to Products
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TopBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56,
//       color: Colors.grey[200],
//       child: Row(
//         children: [
//           Spacer(), // Pushes the following widgets to the right
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {
//               // Show notifications
//             },
//           ),
//           SizedBox(width: 16),
//           CircleAvatar(
//             backgroundImage: NetworkImage('https://via.placeholder.com/40'),
//           ),
//           SizedBox(width: 16),
//         ],
//       ),
//     );
//   }
// }

// class DashboardContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Dashboard'),
//     );
//   }
// }