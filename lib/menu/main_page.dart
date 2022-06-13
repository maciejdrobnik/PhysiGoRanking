import 'package:flutter/material.dart';
import 'package:physigo_ranking/home/home_page.dart';
import 'package:physigo_ranking/ranking/ranking_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  static const List<Widget> _widgets = [
    HomePage(),
    RankingPage(),
  ];
  int _selectedIndex = 0;

  void _onMenuTap(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // need to specify fixed with more than 3 items
          currentIndex: _selectedIndex,
          onTap: _onMenuTap,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Ranking"),
          ],
        ),
        body: _widgets[_selectedIndex],
      ),
    );
  }
}
