import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import 'chat_screen.dart';
import 'booking_screen.dart';

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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 60,
              backgroundColor: worker.color,
              child: Icon(
                worker.icon,
                size: 55,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              worker.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            if (worker.verified)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Verified Mahir",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [

                    ListTile(
                      leading: const Icon(Icons.work),
                      title: const Text("Category"),
                      subtitle: Text(worker.category),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.location_city),
                      title: const Text("City"),
                      subtitle: Text(worker.city),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.star),
                      title: const Text("Rating"),
                      subtitle: Text("${worker.rating} ⭐"),
                    ),

                    const Divider(),

                    ListTile(
                      leading: const Icon(Icons.assignment),
                      title: const Text("Completed Jobs"),
                      subtitle: Text("${worker.totalJobs} Jobs"),
                    ),

                    const Divider(),

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
              child: const Text(
                "About Mahir",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  worker.bio,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [              children: [

                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.call),
                    label: const Text("Call"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Call: ${worker.phone}"),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.message),
                    label: const Text("WhatsApp"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "WhatsApp: ${worker.whatsapp}",
                          ),
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.chat),
                label: const Text("Chat Now"),
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
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  "Book Now (${worker.price})",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(
                        worker: worker,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}