class ReviewSummary {
  final int? totalReviews;
  final double? averageRating;

  ReviewSummary({this.totalReviews, this.averageRating});

  factory ReviewSummary.fromJson(Map<String, dynamic> json) {
    return ReviewSummary(
      totalReviews: json['totalReviews'] as int?,
      averageRating: json['averageRating']?.toDouble(),
    );
  }
}