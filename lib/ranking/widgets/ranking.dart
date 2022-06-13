import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  final Widget ranks;
  final Widget currentUser;
  const Ranking({required this.ranks, required this.currentUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          child: ranks,
        ),
        Container(
          child: currentUser,
        )
      ],
    );
  }
}
