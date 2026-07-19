import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/app_theme.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://siqvtbulxjxpqawxtstk.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNpcXZ0YnVseGp4cHFhd3h0c3RrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODM5NDIwMjUsImV4cCI6MjA5OTUxODAyNX0.E4oEbM5Eauzfw30DLcwJMK-lQ0G-0uGSCY5vFUR_Nr8',
  );

  runApp(const MahirApp());
}

class MahirApp extends StatelessWidget {
  const MahirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahir1',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
    );
  }
}