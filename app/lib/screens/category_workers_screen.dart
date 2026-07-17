import 'package:flutter/material.dart';

import '../models/worker_model.dart';
import '../services/mock_data.dart';
import '../widgets/worker_card.dart';

class CategoryWorkersScreen extends StatelessWidget {
  final String category;

  const CategoryWorkersScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final workers = MockData.workers
        .where((w) => w.category == category)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: workers.isEmpty
          ? const Center(
              child: Text(
                "No Providers Found",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: workers.length,
              itemBuilder: (context, index) {
                return WorkerCard(
                  worker: workers[index],
                );
              },
            ),
    );
  }
