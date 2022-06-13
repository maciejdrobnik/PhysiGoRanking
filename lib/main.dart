import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:physigo_ranking/firebase_options.dart';
import 'package:physigo_ranking/ranking/ranking_page.dart';
import 'package:physigo_ranking/Services/AuthService.dart';
import 'package:physigo_ranking/Services/logged_in_user.dart';
import 'package:physigo_ranking/logIn.dart';
import 'package:physigo_ranking/welcomeScreen.dart';

import 'home/home_page.dart';
import 'menu/main_page.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PhysiGoRanking());
}

class PhysiGoRanking extends StatelessWidget {
  const PhysiGoRanking({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LoggedInUser?>(
        future: AuthenticationServices.getCurrentUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'PhysiGo',
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            initialRoute: snapshot.hasData ? '/mainPage' : "/",
          routes: {
            '/': (context) => MyHomePage(title: '',),
            '/login': (context) => LogIn(title: ''),
            '/mainPage': (context) => MainPage()
          },
          );
        });
  }
}



