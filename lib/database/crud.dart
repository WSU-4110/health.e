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

    QuerySnapshot snapshot =
    await usersCollection.orderBy("id", descending: true).limit(1).get();
    int lastId = snapshot.docs.isNotEmpty ? snapshot.docs.first["id"] : 0;
    int newId = lastId + 1;


    return await usersCollection.doc(newId.toString()).set({
      'id' : newId,
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



  Future<void> updateUserWeight(String userId, int weight) async {
    final userDocRef = FirebaseFirestore.instance.collection('users').doc(userId);
    await userDocRef.update({'weight': weight});
  }


}
