import 'package:flutter/material.dart';
import '../models/worker_model.dart';
import '../screens/booking_screen.dart';
import '../screens/worker_profile_screen.dart';

class WorkerCard extends StatelessWidget {
  final WorkerModel worker;

  const WorkerCard({
    super.key,
    required this.worker,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [

            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => WorkerProfileScreen(
                      worker: worker,
                    ),
                  ),
                );
              },
              child: Row(
                children: [

                  CircleAvatar(
                    radius: 28,
                    backgroundColor: worker.color,
                    child: Icon(
                      worker.icon,
                      color: Colors.black,
                      size: 28,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [

                        Row(
                          children: [

                            Expanded(
                              child: Text(
                                worker.name,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            if (worker.verified)
                              const Icon(
                                Icons.verified,
                                color: Colors.blue,
                                size: 20,
                              ),

                          ],
                        ),

                        const SizedBox(height: 4),

                        Text(
                          worker.category,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Row(
                          children: [

                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 18,
                            ),

                            const SizedBox(width: 4),

                            Text(worker.rating.toString()),

                            const SizedBox(width: 10),

                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.red,
                            ),

                            const SizedBox(width: 2),

                            Text(worker.city),

                          ],
                        ),

                        const SizedBox(height: 8),

                        Text(
                          worker.bio,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.calendar_today),
                label: const Text("Book Now"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(
                        worker: worker,
                      ),
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