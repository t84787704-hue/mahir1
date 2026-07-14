import 'package:flutter/material.dart';
import '../models/worker_model.dart';
class MockData {
  static List<WorkerModel> workers = [
    WorkerModel(id: '1', name: 'Ali Plumber', category: 'Plumber', city: 'Lahore', rating: 4.8, totalJobs: 120, price: 'Rs 800/hr', icon: Icons.plumbing, color: Color(0xFFDBEAFE)),
    WorkerModel(id: '2', name: 'Usman Electric', category: 'Electrician', city: 'Karachi', rating: 4.9, totalJobs: 200, price: 'Rs 1000/hr', icon: Icons.electrical_services, color: Color(0xFFFEF3C7)),
    WorkerModel(id: '3', name: 'Ahmed Painter', category: 'Painter', city: 'Islamabad', rating: 4.7, totalJobs: 95, price: 'Rs 1200/hr', icon: Icons.format_paint, color: Color(0xFFD1FAE5)),
  ];
}
