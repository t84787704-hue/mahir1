import '../models/review_model.dart';

class ReviewData {
  static final List<ReviewModel> reviews = [];

  static void addReview(ReviewModel review) {
    reviews.add(review);
  }

  static List<ReviewModel> getWorkerReviews(String workerName) {
    return reviews
        .where((e) => e.workerName == workerName)
        .toList();
  }

  static double getAverageRating(String workerName) {
    final data = getWorkerReviews(workerName);

    if (data.isEmpty) return 0;

    double total = 0;

    for (final review in data) {
      total += review.rating;
    }

    return total / data.length;
  }
}