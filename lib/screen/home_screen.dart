// import 'package:flutter/material.dart';
// import 'package:massaging_ui_design/screen/auth_screen/massage_screen/massaging_screen.dart';
// import 'package:massaging_ui_design/screen/calls/calls_screen.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//    int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         body: TabBarView(
//             children: [
//           MassagingScreen(),
//           CallsScreen()
//
//         ]),
//         bottomNavigationBar: _bottomNavigation(),
//       ),
//     );
//   }
//
//   Widget _bottomNavigation() {
//     return BottomNavigationBar(
//       onTap: (index) {
//
//         setState(() {
//           _currentIndex = index;
//         });
//
//         if(_currentIndex == 0){
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MassagingScreen(),));
//         }
//         if(_currentIndex == 1){
//           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CallsScreen(),));
//
//         }
//
//       },
//       currentIndex: _currentIndex,
//       type: BottomNavigationBarType.fixed,
//       iconSize: 24,
//       items: const [
//         BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.wifi_calling_3_outlined),
//           label: 'Calls',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.contact_mail),
//           label: 'Contacts',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           label: 'Settings',
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:massaging_ui_design/screen/auth_screen/massage_screen/massaging_screen.dart';
import 'package:massaging_ui_design/screen/calls/calls_screen.dart';

import 'contacts/contacts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MassagingScreen(),
    CallsScreen(),
    ContactListScreen(), // Placeholder
    Center(child: Text("Settings Screen")), // Placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.teal,
      iconSize: 24,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi_calling_3_outlined),
          label: 'Calls',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_mail),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
