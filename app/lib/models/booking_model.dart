class BookingModel {
  final String id;
  final String workerId;
  final String workerName;
  final String category;
  final String date;
  final String time;
  final String address;
  final String problem;
  final String price;
  final String status;

  BookingModel({
    required this.id,
    required this.workerId,
    required this.workerName,
    required this.category,
    required this.date,
    required this.time,
    required this.address,
    required this.problem,
    required this.price,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'worker_id': workerId,
      'worker_name': workerName,
      'category': category,
      'date': date,
      'time': time,
      'address': address,
      'problem': problem,
      'price': price,
      'status': status,
    };
  }

  factory BookingModel.fromMap(Map<String, dynamic> map) {
    return BookingModel(
      id: map['id'] ?? '',
      workerId: map['worker_id'] ?? '',
      workerName: map['worker_name'] ?? '',
      category: map['category'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      address: map['address'] ?? '',
      problem: map['problem'] ?? '',
      price: map['price'] ?? '',
      status: map['status'] ?? '',
    );
  }
}