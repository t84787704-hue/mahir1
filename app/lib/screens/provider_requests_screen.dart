import 'package:flutter/material.dart';
import '../data/booking_history.dart';
import '../models/worker_model.dart';
import '../widgets/request_card.dart';

class ProviderRequestsScreen extends StatelessWidget {
  const ProviderRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Requests"),
        centerTitle: true,
      ),
      body: BookingHistory.bookings.isEmpty
          ? const Center(
              child: Text(
                "No Booking Requests",
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

                return RequestCard(
                  worker: worker,
                  booking: booking,
                );
              },
            ),
    );
  }
}