import 'package:flutter/material.dart';
import 'package:physigo_ranking/ranking/widgets/ranking.dart';
import '../currentUser.dart';
import '../widgets/datatable.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  static const List<Widget> _widgets = [
    Ranking(ranks: MyDataTable(name: "daily_points"), currentUser: CurrentUser(name: "daily_points")),
    Ranking(ranks: MyDataTable(name: "weekly_points"), currentUser: CurrentUser(name: "weekly_points")),
    Ranking(ranks: MyDataTable(name: "total_points"), currentUser: CurrentUser(name: "total_points")),
    Ranking(ranks: MyDataTable(name: "total_points"), currentUser: CurrentUser(name: "total_points")),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _widgets.length,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(child: Text("Daily Challenge", style: TextStyle(fontSize: 18))),
                Tab(child: Text("Weekly Challenge", style: TextStyle(fontSize: 18))),
                Tab(child: Text("Total", style: TextStyle(fontSize: 18))),
                Tab(child: Text("Exercises", style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
          body: const Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: TabBarView(children: _widgets),
            ),
          ),
        ),
      ),
    );
  }
}
