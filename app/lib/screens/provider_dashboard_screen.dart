import 'package:flutter/material.dart';
import 'provider_setup_screen.dart';
class ProviderDashboardScreen extends StatefulWidget{
  const ProviderDashboardScreen({super.key});
  @override
  State<ProviderDashboardScreen> createState()=> _ProviderDashboardScreenState();
}
class _ProviderDashboardScreenState extends State<ProviderDashboardScreen>{
  bool isOnline=true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Provider Dashboard')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: isOnline? Colors.green[50]: Colors.red[50], borderRadius: BorderRadius.circular(12)), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(isOnline? 'You are Online - Ready for Work': 'You are Offline', style: TextStyle(fontWeight: FontWeight.bold, color: isOnline? Colors.green: Colors.red)), Switch(value: isOnline, onChanged: (v)=> setState(()=> isOnline=v))])),
          const SizedBox(height: 20),
          Row(children: [Expanded(child: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.book, color: Color(0xFF2563EB)), SizedBox(height: 8), Text('3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text('Today Bookings')]))), SizedBox(width: 12), Expanded(child: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.work, color: Color(0xFF2563EB)), SizedBox(height: 8), Text('120', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text('Total Jobs')])))]),
          const SizedBox(height: 20),
          const Text('Recent Requests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Card(child: ListTile(title: const Text('Ahmed - Plumber Needed'), subtitle: const Text('Lahore • Tomorrow 10AM'), trailing: ElevatedButton(onPressed: (){}, child: const Text('Accept')))),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> const ProviderSetupScreen())), label: const Text('Edit Profile'), icon: const Icon(Icons.edit)),
    );
  }
}
