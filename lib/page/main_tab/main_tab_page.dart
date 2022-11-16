import 'package:flutter/material.dart';
import 'package:flutter_starter_private/page/movie_favorits/movie_favorits_page.dart';
import 'package:flutter_starter_private/page/movie_list/movie_list_page.dart';

import '../../theme/apptheme.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  int indexBottom = 0;

  late final pages;
  
  final _pageController = PageController();
  @override
  void initState() {
    pages = [
      const MovieListPage(),
      const MovieFavoritsPage(),
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
          _pageController.jumpToPage(bar);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Popular'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
      body: PageView(
        children: pages,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            indexBottom = value;
          });
        },
      ),
    );
  }
}
