class ResumeRate {
  final int rank;
  final String feedback;

  ResumeRate({
    required this.rank,
    required this.feedback,
  });

  factory ResumeRate.fromJson(Map<String, dynamic> json) => ResumeRate(
        rank: json['Rank'],
        feedback: json['Feedback'],
      );
}
