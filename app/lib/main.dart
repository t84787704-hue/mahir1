import 'package:flutter/material.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/search_screen.dart';
import 'screens/worker_details_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/chat_screen.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MahirApp());
}

class MahirApp extends StatelessWidget {
  const MahirApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahir1',
      theme: ThemeData.light(),
      initialRoute: AppRoutes.mainNavigation,
      routes: {
        AppRoutes.mainNavigation: (context) => MainNavigationScreen(),
        AppRoutes.search: (context) => SearchScreen(),
        AppRoutes.workerDetails: (context) => WorkerDetailsScreen(),
        AppRoutes.chatList: (context) => ChatListScreen(),
        AppRoutes.chat: (context) => ChatScreen(),
      },
    );
  }
}
