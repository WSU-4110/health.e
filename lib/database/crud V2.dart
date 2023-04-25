import 'package:cloud_firestore/cloud_firestore.dart';

class Crud2 {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference workoutLogCollection =
      FirebaseFirestore.instance.collection('workout_log');
  final CollectionReference assessmentsCollection =
      FirebaseFirestore.instance.collection('assessments');

  Future<void> createUser(
      String id,
      String username,
      String email,
      String password,
      int level,
      int weight,
      int height,
      int age,
      String gender,
      String goal,
      int dailyCaloricIntake,
      String lastAssessmentDate,
      List<dynamic> workoutHistory,
      bool notificationsEnabled) async {
    return await usersCollection.doc(id).set({
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'level': level,
      'weight': weight,
      'height': height,
      'age': age,
      'gender': gender,
      'goal': goal,
      'daily_caloric_intake': dailyCaloricIntake,
      'last_assessment_date': lastAssessmentDate,
      'workout_history': workoutHistory,
      'notifications_enabled': notificationsEnabled
    });
  }

  Future<DocumentSnapshot> readUser(String id) async {
    return await usersCollection.doc(id).get();
  }

  Future<void> updateUser(
      String id,
      String username,
      String email,
      String password,
      int level,
      int weight,
      int height,
      int age,
      String gender,
      String goal,
      int dailyCaloricIntake,
      String lastAssessmentDate,
      List<dynamic> workoutHistory,
      bool notificationsEnabled) async {
    return await usersCollection.doc(id).update({
      'username': username,
      'email': email,
      'password': password,
      'level': level,
      'weight': weight,
      'height': height,
      'age': age,
      'gender': gender,
      'goal': goal,
      'daily_caloric_intake': dailyCaloricIntake,
      'last_assessment_date': lastAssessmentDate,
      'workout_history': workoutHistory,
      'notifications_enabled': notificationsEnabled
    });
  }

  Future<void> deleteUser(String id) async {
    return await usersCollection.doc(id).delete();
  }

  Future<DocumentReference> logWorkout(String username, String workoutLog,
      {required Timestamp logDate}) async {
    return await workoutLogCollection.add({
      'username': username,
      'workout_log': workoutLog,
      'log_date': logDate ?? Timestamp.now()
    });
  }

  Future<QuerySnapshot> readUserWorkoutLogs(String username) async {
    return await workoutLogCollection
        .where('username', isEqualTo: username)
        .orderBy('log_date', descending: true)
        .get();
  }

  Future<DocumentReference> addAssessment(String username, String assessment,
      {required Timestamp assessmentDate}) async {
    return await assessmentsCollection.add({
      'username': username,
      'assessment': assessment,
      'assessment_date': assessmentDate ?? Timestamp.now()
    });
  }

  Future<QuerySnapshot> readUserAssessments(String username) async {
    return await assessmentsCollection
        .where('username', isEqualTo: username)
        .orderBy('assessment_date', descending: true)
        .get();
  }
}
