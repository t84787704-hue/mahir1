import 'package:flutter/material.dart';
import '../models/worker_model.dart';

class WorkerProfileScreen extends StatelessWidget {
  final WorkerModel worker;

  const WorkerProfileScreen({
    super.key,
    required this.worker,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(worker.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: worker.color,
              child: Icon(
                worker.icon,
                size: 50,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 16),

            Text(
              worker.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              worker.category,
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Icon(Icons.star,color: Colors.amber),

                const SizedBox(width:5),

                Text(
                  worker.rating.toString(),
                ),

                const SizedBox(width:20),

                const Icon(Icons.location_on),

                Text(worker.city),

              ],
            ),

            const SizedBox(height:20),

            Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [

                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(worker.phone),
                    ),

                    ListTile(
                      leading: Icon(Icons.chat),
                      title: Text(worker.whatsapp),
                    ),

                    ListTile(
                      leading: Icon(Icons.work),
                      title: Text(worker.totalJobs.toString()),
                      subtitle: Text("Jobs Completed"),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height:25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.calendar_today),
                label: Text("Book Now"),
              ),
            ),

          ],
        ),
      ),
    );
  }
}