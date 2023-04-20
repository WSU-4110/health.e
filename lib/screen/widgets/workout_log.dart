import 'package:cloud_firestore/cloud_firestore.dart';

class WorkoutLog {
  final DateTime logDate;
  final String workoutLog;

  WorkoutLog({required this.logDate, required this.workoutLog});

  factory WorkoutLog.fromJson(Map<String, dynamic> json) {
    return WorkoutLog(
      logDate: (json['log_date'] as Timestamp).toDate(),
      workoutLog: json['workout_log'] as String,
    );
  }
}
