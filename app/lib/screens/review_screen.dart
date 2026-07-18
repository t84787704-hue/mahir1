import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import '../models/review_model.dart';
import '../data/review_data.dart';

class ReviewScreen extends StatefulWidget {
  final WorkerModel worker;

  const ReviewScreen({
    super.key,
    required this.worker,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  double rating = 5;
  final reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rate Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              widget.worker.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Slider(
              value: rating,
              min: 1,
              max: 5,
              divisions: 4,
              label: rating.toString(),
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),

            Text(
              "${rating.toStringAsFixed(1)} ⭐",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: reviewController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Write Review",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Submit Review"),
                onPressed: () {

                  ReviewData.addReview(
                    ReviewModel(
                      workerName: widget.worker.name,
                      rating: rating,
                      review: reviewController.text.trim(),
                    ),
                  );

                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Review Submitted"),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}