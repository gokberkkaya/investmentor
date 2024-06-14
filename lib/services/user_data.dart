import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final String name;
  final String? jobTitle;
  final String? birthday;
  final String? gender;
  final String? email;
  final String? phoneNumber;

  UserData({
    required this.name,
    this.jobTitle,
    this.birthday,
    this.gender,
    this.email,
    this.phoneNumber
  });

  factory UserData.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return UserData(
      name: data['name'] ?? '',
      jobTitle: data['jobTitle'],
      birthday: data['birthday'],
      gender: data['gender'],
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'],
    );
  }

  static Future<UserData?> getUserData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await FirebaseFirestore.instance.collection("users").doc(userId).get();

      if (documentSnapshot.exists) {
        return UserData.fromFirestore(documentSnapshot);
      } else {
        return null;
      }
    } catch (e) {
      print("Firestore Hata: $e");

      return null;
    }
  }
}