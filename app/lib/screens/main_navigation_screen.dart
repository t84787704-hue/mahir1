import 'package:flutter/material.dart';
import '../models/user_model.dart';

import 'customer_home_screen.dart';
import 'provider_home_screen.dart';
import 'search_screen.dart';
import 'chat_list_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen extends StatefulWidget {
  final UserRole role;

  const MainNavigationScreen({
    super.key,
    required this.role,
  });

  @override
  State<MainNavigationScreen> createState() =>
      _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {
  int _i = 0;

  @override
  Widget build(BuildContext context) {
    final bool isCust =
        widget.role == UserRole.customer;

    final pages = isCust
        ? [
            const CustomerHomeScreen(),
            const SearchScreen(),
            const ChatListScreen(),
            const ProfileScreen(),
          ]
        : [
            const ProviderHomeScreen(),
            const ChatListScreen(),
            const ProfileScreen(),
          ];

    final items = isCust
        ? const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ]
        : const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ];

    return Scaffold(
      body: pages[_i],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _i,
        onTap: (index) {
          setState(() {
            _i = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2563EB),
        items: items,
      ),
    );
  }
}