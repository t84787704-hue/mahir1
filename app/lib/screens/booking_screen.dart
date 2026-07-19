import 'package:flutter/material.dart';

import '../models/worker_model.dart';
import '../models/booking_model.dart';
import '../services/booking_service.dart';
import 'booking_success_screen.dart';

class BookingScreen extends StatefulWidget {
  final WorkerModel worker;

  const BookingScreen({
    super.key,
    required this.worker,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final BookingService bookingService = BookingService();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final addressController = TextEditingController();
  final problemController = TextEditingController();

  Future<void> pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  Future<void> pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  void dispose() {
    addressController.dispose();
    problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Service"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.worker.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              widget.worker.category,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 25),
            const Text(
              "Select Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.calendar_month),
                label: Text(
                  selectedDate == null
                      ? "Choose Date"
                      : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                ),
                onPressed: pickDate,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Select Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                icon: const Icon(Icons.access_time),
                label: Text(
                  selectedTime == null
                      ? "Choose Time"
                      : selectedTime!.format(context),
                ),
                onPressed: pickTime,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: "Service Address",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: problemController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Describe Your Problem",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
            ),

            const SizedBox(height: 25),

            Card(
              child: ListTile(
                leading: const Icon(Icons.payments),
                title: const Text("Estimated Price"),
                subtitle: Text(widget.worker.price),
              ),
            ),

            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.check_circle),
                label: const Text(
                  "Confirm Booking",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  if (selectedDate == null ||
                      selectedTime == null ||
                      addressController.text.trim().isEmpty ||
                      problemController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all booking details"),
                      ),
                    );
                    return;
                  }

                  final booking = BookingModel(
                    workerName: widget.worker.name,
                    category: widget.worker.category,
                    date:
                        "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                    time: selectedTime!.format(context),
                    address: addressController.text.trim(),
                    problem: problemController.text.trim(),
                    price: widget.worker.price,
                    status: "Pending",
                  );

                  try {
                    await bookingService.saveBooking(booking);

                    if (!mounted) return;

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookingSuccessScreen(
                          workerName: widget.worker.name,
                        ),
                      ),
                    );
                  } catch (e) {
                    if (!mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Booking Failed\n$e"),
                      ),
                    );
                  }
                },
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}