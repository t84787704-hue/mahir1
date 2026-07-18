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
                const Icon(Icons.star, color: Colors.amber),
                const SizedBox(width: 5),
                Text(worker.rating.toString()),
                const SizedBox(width: 20),
                const Icon(Icons.location_on),
                Text(worker.city),
              ],
            ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(worker.phone),
                    ),
                    ListTile(
                      leading: const Icon(Icons.chat),
                      title: Text(worker.whatsapp),
                    ),
                    ListTile(
                      leading: const Icon(Icons.work),
                      title: Text(worker.totalJobs.toString()),
                      subtitle: const Text("Jobs Completed"),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today),
                label: const Text("Book Now"),
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Call feature coming soon"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("WhatsApp feature coming soon"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.chat),
                    label: const Text("WhatsApp"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Customer Reviews",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            const Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("⭐⭐⭐⭐⭐"),
                subtitle: Text(
                  "Excellent service. Highly recommended.",
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text("⭐⭐⭐⭐"),
                subtitle: Text(
                  "Very professional worker.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}