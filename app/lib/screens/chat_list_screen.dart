import 'package:flutter/material.dart';
import 'chat_screen.dart';
class ChatListScreen extends StatelessWidget{ const ChatListScreen({super.key}); @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Messages')), body: ListView(children: [ListTile(leading: CircleAvatar(child: Text('A')), title: Text('Ali Plumber'), subtitle: Text('10 min me araha hu'), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> ChatScreen(name: 'Ali Plumber'))))])); } }
