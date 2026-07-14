import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/app_theme.dart';
import 'routes/app_routes.dart';

import 'screens/account_type_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/customer_profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/worker_details_screen.dart';
import 'screens/worker_profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vwvfwmmlehpkpuybxort.supabase.co',
    anonKey: 'sb_publishable_KE3Ye6dg5_sd8ae7cf_a8A_N8pJNkH2',
  );

  runApp(const MahirApp());
}

class MahirApp extends StatelessWidget {
  const MahirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahir',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashScreen(),
        AppRoutes.onboarding: (context) => OnboardingScreen(),
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.accountType: (context) => AccountTypeScreen(),
        AppRoutes.customerProfile: (context) =>
            CustomerProfileScreen(),
        AppRoutes.workerProfile: (context) =>
            WorkerProfileScreen(),
        AppRoutes.home: (context) =>
            MainNavigationScreen(),
        AppRoutes.search: (context) => SearchScreen(),
        AppRoutes.workerDetails: (context) =>
            WorkerDetailsScreen(),
        AppRoutes.chatList: (context) =>
            ChatListScreen(),
        AppRoutes.chat: (context) => ChatScreen(),
      },
    );
  }
}