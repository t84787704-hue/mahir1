enum BookingStatus {
  pending,
  accepted,
  rejected,
  completed,
}

extension BookingStatusText on BookingStatus {
  String get text {
    switch (this) {
      case BookingStatus.pending:
        return "Pending";
      case BookingStatus.accepted:
        return "Accepted";
      case BookingStatus.rejected:
        return "Rejected";
      case BookingStatus.completed:
        return "Completed";
    }
  }
}