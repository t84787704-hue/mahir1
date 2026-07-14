import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import '../screens/worker_details_screen.dart';
class WorkerCard extends StatelessWidget{
  final WorkerModel worker;
  const WorkerCard({super.key, required this.worker});
  @override
  Widget build(BuildContext context){
    return Card(margin: EdgeInsets.only(bottom: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: ListTile(leading: CircleAvatar(backgroundColor: Colors.blue[100], child: Text(worker.name[0])), title: Text(worker.name, style: TextStyle(fontWeight: FontWeight.bold)), subtitle: Text('${worker.category} • ${worker.city} • ⭐ ${worker.rating}'), trailing: Text(worker.price, style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB), fontSize: 12)), onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=> WorkerDetailsScreen(worker: worker)))));
  }
}
