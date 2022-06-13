import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:physigo_ranking/Services/logged_in_user.dart';
import 'Services/AuthService.dart';

class CurrentUser extends StatefulWidget {
  const CurrentUser({required this.name, Key? key}) : super(key: key);
  final String name;
  @override
  State<CurrentUser> createState() => _CurrentUserState();
}

class _CurrentUserState extends State<CurrentUser> {
  final AuthenticationServices _auth = AuthenticationServices();
  late Future<LoggedInUser?> user = AuthenticationServices.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.black,
        )
      ),
      height: 39,
    child: FutureBuilder<LoggedInUser?>(
      future: user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Wait a moment');
        } else if (snapshot.connectionState == ConnectionState.done) {
          dynamic user2 = snapshot.data;
          int points = 0;
          if(widget.name == "daily_points"){
            points = user2.dailyPoints;
          }
          else if(widget.name == "weekly_points"){
            points = user2.weeklyPoints;
          }
          else{
            points = user2.totalPoints;
          }
          // DatabaseManager manager = DatabaseManager(widget.name);
          return Row(
            children: [
              SizedBox(
                width: 25,
              ),
              SizedBox(
                width: 40,
                child: FutureBuilder(
                  future: AuthenticationServices.getPlace(widget.name),
                  builder: (context, snapshot) {
                    return Text("${snapshot.data}");
                  },
                ),
              ),
              SizedBox(
                width: 135,
                child: Text(user2.sharedId),
              ),
              SizedBox(
                width: 60,
                child: Text(user2.name),
              ),
              SizedBox(
                width: 50,
                child: Text("$points"),
              ),
            ],
          );
        }
        return const Text('Something went wrong');
      },
    ),
    );
  }
}
