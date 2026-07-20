import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/booking_model.dart';

class BookingService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<void> saveBooking(BookingModel booking) async {
    await _supabase
        .from('bookings')
        .insert(booking.toMap());
  }

  Future<List<BookingModel>> getBookings() async {
    final data = await _supabase
        .from('bookings')
        .select()
        .order('created_at', ascending: false);

    return (data as List)
        .map((e) => BookingModel.fromMap(e))
        .toList();
  }

  Future<void> deleteBooking(String id) async {
    await _supabase
        .from('bookings')
        .delete()
        .eq('id', id);
  }
}