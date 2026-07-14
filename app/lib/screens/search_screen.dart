import 'package:flutter/material.dart';
import '../services/mock_data.dart';
import '../widgets/worker_card.dart';
class SearchScreen extends StatelessWidget{ const SearchScreen({super.key}); @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text('Search')), body: ListView(padding: EdgeInsets.all(16), children: MockData.workers.map((w)=> WorkerCard(worker: w)).toList())); } }
