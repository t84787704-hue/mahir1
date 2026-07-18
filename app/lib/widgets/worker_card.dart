import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import '../models/booking_status.dart';
import '../data/booking_history.dart';

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
    final int index = BookingHistory.bookings.indexOf(booking);

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

            const SizedBox(height: 8),

            Text(
              "Status: ${(booking["status"] as BookingStatus).text}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      BookingHistory.updateStatus(
                        index,
                        BookingStatus.accepted,
                      );

                      (context as Element).markNeedsBuild();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Accepted"),
                        ),
                      );
                    },
                    child: const Text("Accept"),
                  ),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      BookingHistory.updateStatus(
                        index,
                        BookingStatus.rejected,
                      );

                      (context as Element).markNeedsBuild();

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Booking Rejected"),
                        ),
                      );
                    },
                    child: const Text("Reject"),
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