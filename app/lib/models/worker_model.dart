import 'package:flutter/material.dart';

class WorkerModel {
  final String id;
  final String name;
  final String category;
  final String city;
  final double rating;
  final int totalJobs;
  final String price;
  final IconData icon;
  final Color color;

  // Description
  final String bio;

  // Contact
  final String phone;
  final String whatsapp;

  // Verification
  final bool verified;

  WorkerModel({
    required this.id,
    required this.name,
    required this.category,
    required this.city,
    required this.rating,
    required this.totalJobs,
    required this.price,
    required this.icon,
    required this.color,
    this.bio = 'Verified Professional',
    this.phone = '+966500000000',
    this.whatsapp = '+966500000000',
    this.verified = true,
  });
}