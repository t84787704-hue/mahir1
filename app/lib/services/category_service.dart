import 'package:flutter/material.dart';
import '../models/category_model.dart';

class CategoryService {
  static List<CategoryModel> categories = [

    CategoryModel(
      id: "1",
      name: "Electrician",
      icon: Icons.electrical_services,
      color: Colors.amber,
      totalProviders: 356,
    ),

    CategoryModel(
      id: "2",
      name: "AC Repair",
      icon: Icons.ac_unit,
      color: Colors.blue,
      totalProviders: 241,
    ),

    CategoryModel(
      id: "3",
      name: "Plumber",
      icon: Icons.plumbing,
      color: Colors.green,
      totalProviders: 190,
    ),

    CategoryModel(
      id: "4",
      name: "Mobile Repair",
      icon: Icons.phone_android,
      color: Colors.deepPurple,
      totalProviders: 128,
    ),

    CategoryModel(
      id: "5",
      name: "Bus Driver",
      icon: Icons.directions_bus,
      color: Colors.orange,
      totalProviders: 84,
    ),

    CategoryModel(
      id: "6",
      name: "Software Engineer",
      icon: Icons.computer,
      color: Colors.indigo,
      totalProviders: 73,
    ),
  ];
}