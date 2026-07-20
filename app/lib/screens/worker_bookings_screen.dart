import 'package:flutter/material.dart';

import '../models/booking_model.dart';
import '../services/booking_service.dart';

class WorkerBookingsScreen extends StatefulWidget {
  const WorkerBookingsScreen({super.key});

  @override
  State<WorkerBookingsScreen> createState() =>
      _WorkerBookingsScreenState();
}

class _WorkerBookingsScreenState
    extends State<WorkerBookingsScreen> {

  final BookingService bookingService = BookingService();

  late Future<List<BookingModel>> bookings;

  @override
  void initState() {
    super.initState();
    _loadBookings();
  }

  void _loadBookings() {
    bookings = bookingService.getBookings();
  }

  Future<void> _updateStatus(
    String id,
    String status,
  ) async {

    await bookingService.updateBookingStatus(
      id: id,
      status: status,
    );

    setState(() {
      _loadBookings();
    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Booking marked as $status",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Customer Bookings",
        ),
        centerTitle: true,
      ),

      body: FutureBuilder<List<BookingModel>>(

        future: bookings,

        builder: (context, snapshot) {

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          final list = snapshot.data ?? [];

          if (list.isEmpty) {
            return const Center(
              child: Text(
                "No Customer Bookings",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(15),
            itemCount: list.length,
            itemBuilder: (context, index) {

              final booking = list[index];

              return Card(
                margin: const EdgeInsets.only(
                  bottom: 15,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(15),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [                      Text(
                        booking.workerName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Category : ${booking.category}",
                      ),

                      Text(
                        "Date : ${booking.date}",
                      ),

                      Text(
                        "Time : ${booking.time}",
                      ),

                      Text(
                        "Address : ${booking.address}",
                      ),

                      Text(
                        "Problem : ${booking.problem}",
                      ),

                      Text(
                        "Price : ${booking.price}",
                      ),

                      const SizedBox(height: 12),

                      Text(
                        "Status : ${booking.status}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: booking.status == "Pending"
                              ? Colors.orange
                              : booking.status == "Accepted"
                                  ? Colors.blue
                                  : booking.status == "Completed"
                                      ? Colors.green
                                      : Colors.red,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: booking.id == null
                                  ? null
                                  : () {
                                      _updateStatus(
                                        booking.id!,
                                        "Accepted",
                                      );
                                    },
                              child: const Text(
                                "Accept",
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: booking.id == null
                                  ? null
                                  : () {
                                      _updateStatus(
                                        booking.id!,
                                        "Rejected",
                                      );
                                    },
                              child: const Text(
                                "Reject",
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                              ),
                              onPressed: booking.id == null
                                  ? null
                                  : () {
                                      _updateStatus(
                                        booking.id!,
                                        "Completed",
                                      );
                                    },
                              child: const Text(
                                "Complete",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );        },
      ),
    );
  }
}