import 'package:flutter/material.dart';
import 'role_selection_screen.dart';
import '../services/auth_service.dart';
class LoginScreen extends StatefulWidget{ const LoginScreen({super.key}); @override State<LoginScreen> createState()=> _LoginScreenState(); }
class _LoginScreenState extends State<LoginScreen>{
  bool load=false;
  @override
  Widget build(BuildContext context){
    return Scaffold(body: SafeArea(child: Padding(padding: EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.handyman, size: 80, color: Color(0xFF2563EB)), SizedBox(height: 16), Text('Mahir1', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)), Text('Gmail Only Login', style: TextStyle(color: Colors.grey)), SizedBox(height: 60), SizedBox(width: double.infinity, child: ElevatedButton.icon(icon: load? SizedBox(width:16,height:16,child:CircularProgressIndicator(strokeWidth:2)): Icon(Icons.g_mobiledata, size: 32), label: Text('Continue with Gmail'), onPressed: load? null : () async { setState(()=> load=true); await AuthService.signInWithGmail(); setState(()=> load=false); if(mounted) Navigator.push(context, MaterialPageRoute(builder: (_)=> const RoleSelectionScreen())); }, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black, side: BorderSide(color: Colors.grey[300]!))))]))));
  }
}
