import 'package:flutter/material.dart';
import '../data/booking_history.dart';
import '../models/worker_model.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Bookings"),
        centerTitle: true,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: BookingHistory.bookings.isEmpty
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

                  return Card(
                    elevation: 3,
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
                      subtitle: Text(
                        "${booking["date"]} • ${booking["time"]}\nStatus: ${booking["status"]}",
                      ),
                      trailing: Text(
                        booking["price"],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}