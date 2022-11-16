import 'package:flutter/material.dart';
import 'package:flutter_starter_private/page/movie_list/movie_list_page.dart';

import '../../theme/apptheme.dart';
import 'main_tab_screen.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int indexBottom = 0;

  late final pages;
  @override
  void initState() {
    pages = [
      MovieListPage(),
      MovieListPage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottom,
        elevation: 10,
        onTap: (bar) {
          setState(() {
            indexBottom = bar;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Popular'),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: 'Favorite'),
        ],
      ),
      body: pages[indexBottom],
    );
  }
}
