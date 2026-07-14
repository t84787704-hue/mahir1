import 'package:flutter/material.dart';
import 'config/app_theme.dart';
import 'screens/login_screen.dart';
void main(){ runApp(const MahirApp()); }
class MahirApp extends StatelessWidget{
  const MahirApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(title: 'Mahir1', debugShowCheckedModeBanner: false, theme: AppTheme.lightTheme, home: const LoginScreen());
  }
}
