import 'package:flutter/material.dart';
import 'package:physigo_ranking/Services/AuthService.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  String get name => AuthenticationServices.user!.name;
  num get totalPoint => AuthenticationServices.user!.totalPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome back $name!",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 36),
          Column(
            children: const [
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Here are your challenges:",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }
}