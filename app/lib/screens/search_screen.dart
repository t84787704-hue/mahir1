import 'package:flutter/material.dart';

import '../services/mock_data.dart';
import '../widgets/worker_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final workers = MockData.workers.where((worker) {
      final query = searchText.toLowerCase();

      return worker.name.toLowerCase().contains(query) ||
          worker.category.toLowerCase().contains(query) ||
          worker.city.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search service, city or provider...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),

          Expanded(
            child: workers.isEmpty
                ? const Center(
                    child: Text(
                      "No Providers Found",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: workers.length,
                    itemBuilder: (context, index) {
                      return WorkerCard(
                        worker: workers[index],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}