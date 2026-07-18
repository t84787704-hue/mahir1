

import 'package:flutter/material.dart';
import '../data/booking_history.dart';
import '../models/worker_model.dart';
import '../models/booking_status.dart';
import 'review_screen.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  Color getStatusColor(BookingStatus status) {
    switch (status) {
      case BookingStatus.pending:
        return Colors.orange;
      case BookingStatus.accepted:
        return Colors.green;
      case BookingStatus.rejected:
        return Colors.red;
      case BookingStatus.completed:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        centerTitle: true,
      ),
      body: BookingHistory.bookings.isEmpty
          ? const Center(
              child: Text(
                "No bookings yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: BookingHistory.bookings.length,
              itemBuilder: (context, index) {
                final booking = BookingHistory.bookings[index];
                final WorkerModel worker =
                    booking["worker"] as WorkerModel;

                final BookingStatus status =
                    booking["status"] as BookingStatus;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: worker.color,
                      child: Icon(
                        worker.icon,
                        color: Colors.black,
                      ),
                    ),
                    title: Text(worker.name),
                    subtitle: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${booking["date"]} • ${booking["time"]}",
                        ),
                        const SizedBox(height: 4),
                        Text(
                          status.text,
                          style: TextStyle(
                            color: getStatusColor(status),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          booking["price"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        if (status == BookingStatus.completed)
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => ReviewScreen(
                                    worker: worker,
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              "Review",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}