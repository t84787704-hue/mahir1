import 'package:flutter/material.dart';
import '../models/worker_model.dart';

class RequestCard extends StatelessWidget {
  final WorkerModel worker;
  final Map<String, dynamic> booking;

  const RequestCard({
    super.key,
    required this.worker,
    required this.booking,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                CircleAvatar(
                  backgroundColor: worker.color,
                  child: Icon(
                    worker.icon,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    worker.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),

            const SizedBox(height: 12),

            Text("📅 Date: ${booking["date"]}"),
            Text("⏰ Time: ${booking["time"]}"),
            Text("📍 Address: ${booking["address"]}"),
            Text("📝 Problem: ${booking["problem"]}"),
            Text("💰 Price: ${booking["price"]}"),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      booking["status"] = "Accepted";

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Accepted"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.check),
                    label: const Text("Accept"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      booking["status"] = "Rejected";

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Rejected"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("Reject"),
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}