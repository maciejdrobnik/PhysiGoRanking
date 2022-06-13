import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  late final String points;
  final CollectionReference profileList =
  FirebaseFirestore.instance.collection('profileInfo');
  CollectionReference usersList =
  FirebaseFirestore.instance.collection("Users");

  DatabaseManager(this.points);

  Future<void> createUserData(String address,
      bool anonymous,
      String birth_date,
      DateTime create_date,
      DateTime lastChallengeDate,
      String mail,
      String name,
      String phoneNumber,
      String shared_id,
      String surname,
      int totalpoints,
      DateTime updated_date,
      String weeklyplace,
      String uid) async {
    print('----------- ' + uid);
    return await usersList.doc(uid).set({
      'address': address,
      'anonymous': anonymous,
      'birth_date': birth_date,
      'created_date': create_date,
      'last_challenge_date': lastChallengeDate,
      'mail': mail,
      'name': name,
      'phone_number': phoneNumber,
      'shared_id': shared_id,
      'surname': surname,
      'total_points': totalpoints,
      'daily_points': 0,
      'weekly_points': 0,
      'updated_date': updated_date,
      'weekly_place': weeklyplace,
    });
  }
}
