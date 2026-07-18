import '../models/worker_model.dart';
import '../models/booking_status.dart';

class BookingHistory {
  static final List<Map<String, dynamic>> bookings = [];

  static void addBooking({
    required WorkerModel worker,
    required String date,
    required String time,
    required String address,
    required String problem,
    required String price,
  }) {
    bookings.insert(0, {
      "worker": worker,
      "date": date,
      "time": time,
      "address": address,
      "problem": problem,
      "price": price,
      "status": BookingStatus.pending,
    });
  }

  static void updateStatus(
    int index,
    BookingStatus status,
  ) {
    bookings[index]["status"] = status;
  }
}