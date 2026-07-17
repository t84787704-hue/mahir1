import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import 'chat_screen.dart';

class WorkerDetailsScreen extends StatelessWidget {
  final WorkerModel worker;

  const WorkerDetailsScreen({
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            CircleAvatar(
              radius: 55,
              backgroundColor: worker.color,
              child: Icon(
                worker.icon,
                size: 50,
                color: Colors.black87,
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

            const SizedBox(height: 6),

            if (worker.verified)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.verified,
                    color: Colors.blue,
                    size: 18,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "Verified Mahir",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [

                    ListTile(
                      leading: const Icon(Icons.work),
                      title: const Text("Category"),
                      subtitle: Text(worker.category),
                    ),

                    ListTile(
                      leading: const Icon(Icons.location_on),
                      title: const Text("City"),
                      subtitle: Text(worker.city),
                    ),

                    ListTile(
                      leading: const Icon(Icons.star),
                      title: const Text("Rating"),
                      subtitle: Text("${worker.rating} ⭐"),
                    ),

                    ListTile(
                      leading: const Icon(Icons.assignment),
                      title: const Text("Completed Jobs"),
                      subtitle: Text(worker.totalJobs.toString()),
                    ),

                    ListTile(
                      leading: const Icon(Icons.attach_money),
                      title: const Text("Price"),
                      subtitle: Text(worker.price),
                    ),

                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "About",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              worker.bio,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),            Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Call: ${worker.phone}",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "WhatsApp: ${worker.whatsapp}",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.message),
                    label: const Text("WhatsApp"),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        name: worker.name,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.chat),
                label: const Text("Chat Now"),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Booking request sent to ${worker.name}",
                      ),
                    ),
                 