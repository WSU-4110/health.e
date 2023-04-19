import 'package:cloud_firestore/cloud_firestore.dart';

class Crud {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference workoutsCollection =
      FirebaseFirestore.instance.collection('workouts');
  final CollectionReference nutritionCollection =
      FirebaseFirestore.instance.collection('nutrition');
  final CollectionReference assessmentsCollection =
      FirebaseFirestore.instance.collection('assessments');

  // Create - Profile (users collection)
  Future<void> createUserProfile(
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

  // Read - Weight, height, gender, name, email (users collection)
  Future<DocumentSnapshot> getUserProfile(String id) async {
    return await usersCollection.doc(id).get();
  }

  // Update - assessment level (users collection, assessments collection)
  Future<void> updateUserProfile(String id, int level) async {
    await usersCollection.doc(id).update({'level': level});

    // Create assessment
    DateTime now = DateTime.now();
    String date =
        "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    await assessmentsCollection.add({
      'user_id': id,
      'date': date,
      'level': level,
      'weight': null,
      'height': null,
      'age': null,
      'gender': null,
      'goal': null,
      'daily_caloric_intake': null,
    });
  }

  // Delete - Profile
  Future<void> deleteUserProfile(String id) async {
    await usersCollection.doc(id).delete();
  }

  Future<Map<String, dynamic>> getUserInfo(String id) async {
    DocumentSnapshot snapshot = await usersCollection.doc(id).get();
    return {
      'age': snapshot.get('age'),
      'height': snapshot.get('height'),
      'weight': snapshot.get('weight'),
      'gender': snapshot.get('gender'),
    };
  }

  Future<String> getUsername(String id) async {
    DocumentSnapshot snapshot = await usersCollection.doc(id).get();
    return snapshot.get('username');
  }

  Future<void> updateUserWeight(String userId, int weight) async {
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userDocRef.update({'weight': weight});
  }



}
