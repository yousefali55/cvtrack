import 'package:meta/meta.dart';

// Model for Evaluation data
class Evaluation {
  final int rank;
  final String feedback;

  Evaluation({
    required this.rank,
    required this.feedback,
  });

  // Factory method to create an Evaluation instance from JSON
  factory Evaluation.fromJson(Map<String, dynamic> json) {
    return Evaluation(
      rank: json['Rank'],
      feedback: json['Feedback'],
    );
  }

  // Method to convert an Evaluation instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'Rank': rank,
      'Feedback': feedback,
    };
  }
}

// Model for a single resume result
class ResumeResult {
  final String fileName;
  final Evaluation evaluation;

  ResumeResult({
    required this.fileName,
    required this.evaluation,
  });

  factory ResumeResult.fromJson(Map<String, dynamic> json) {
    return ResumeResult(
      fileName: json['file_name'],
      evaluation: Evaluation.fromJson(json['evaluation']),
    );
  }

  // Method to convert a ResumeResult instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'file_name': fileName,
      'evaluation': evaluation.toJson(),
    };
  }
}

// Model for the main response
class ResumeResponse {
  final ResumeResult best;
  final List<ResumeResult> results;

  ResumeResponse({
    required this.best,
    required this.results,
  });

  // Factory method to create a ResumeResponse instance from JSON
  factory ResumeResponse.fromJson(Map<String, dynamic> json) {
    return ResumeResponse(
      best: ResumeResult.fromJson(json['best']),
      results: List<ResumeResult>.from(
        json['results'].map((result) => ResumeResult.fromJson(result)),
      ),
    );
  }

  // Method to convert a ResumeResponse instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'best': best.toJson(),
      'results': results.map((result) => result.toJson()).toList(),
    };
  }
}
