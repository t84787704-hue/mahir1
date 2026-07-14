import 'package:flutter/material.dart';
class ProviderSetupScreen extends StatelessWidget{
  const ProviderSetupScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Mahir Profile - Full Setup')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CircleAvatar(radius: 40, backgroundColor: Colors.blue[100], child: Icon(Icons.person, size: 40)),
            SizedBox(height: 16),
            Text('Apna Mahir Profile Complete Karen', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Category (Plumber, Electrician etc)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'City (Lahore, Karachi, Riyadh)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Experience (5 Years)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(labelText: 'Price per Hour (Rs 800/hr)', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 12),
            TextField(maxLines: 3, decoration: InputDecoration(labelText: 'Bio / About Work', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            SizedBox(height: 20),
            ElevatedButton(onPressed: ()=> Navigator.pop(context), child: Text('Save Full Profile')),
          ],
        ),
      ),
    );
  }
}
