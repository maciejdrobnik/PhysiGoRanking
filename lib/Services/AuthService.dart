import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'logged_in_user.dart';

class AuthenticationServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static LoggedInUser? user;


  //LogIn with user
  static Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      await getCurrentUser();
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  static Future<LoggedInUser?> getCurrentUser() async {
    if (user != null) {
      return user;
    }
    if (_auth.currentUser == null) {
      return null;
    }
    var querySnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .where('mail', isEqualTo: _auth.currentUser?.email)
        .get();
    user = LoggedInUser.fromMap(querySnapshot.docs.first.data());
    return user;
  }

  static Future<int> getPlace(String points) async {
    dynamic users;
    if(points == "daily_points"){
      users = await FirebaseFirestore.instance
          .collection('Users')
          .where(points, isGreaterThan: user!.dailyPoints)
          .get();
    }
    else if(points == "weekly_points"){
      users = await FirebaseFirestore.instance
          .collection('Users')
          .where(points, isGreaterThan: user!.weeklyPoints)
          .get();
    }
    else{
      users = await FirebaseFirestore.instance
          .collection('Users')
          .where(points, isGreaterThan: user!.totalPoints)
          .get();
    }
    return users.docs.length + 1;
  }
}
