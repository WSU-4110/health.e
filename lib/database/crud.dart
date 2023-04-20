import 'package:cloud_firestore/cloud_firestore.dart';	
class Crud {	
  final CollectionReference usersCollection =	
      FirebaseFirestore.instance.collection('users');	
  final CollectionReference workoutsCollection =	
      FirebaseFirestore.instance.collection('workout_log');	
  final CollectionReference nutritionCollection =	
      FirebaseFirestore.instance.collection('nutrition');	
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
    // Get the last user document	
    QuerySnapshot snapshot =	
    await usersCollection.orderBy("id", descending: true).limit(1).get();	
    int lastId = snapshot.docs.isNotEmpty ? snapshot.docs.first["id"] : 0;	
    int newId = lastId + 1;	
    // Create the user profile document with the new id	
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
  
  }	
  // Delete - Profile	
  Future<void> deleteUserProfile(String id, String password) async {	
    try {	
      // Get user document	
      DocumentSnapshot snapshot =	
          await usersCollection.doc(id.toString()).get();	
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;	
      // Verify password	
      if (data!['password'] != password) {	
        throw Exception('Invalid password');	
      }	
      // Delete user profile document	
      await usersCollection.doc(id.toString()).delete();	
    } catch (e) {	
      print(e);	
      throw Exception('Failed to delete user profile');	
    }	
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

  Future<void> updateUserLevel(String userId, int level) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    await userRef.update({
      'level': level,
    });
  }
}