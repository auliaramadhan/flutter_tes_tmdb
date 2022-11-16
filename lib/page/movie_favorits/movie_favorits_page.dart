import 'package:flutter/material.dart';

import '../../components/spacing.dart';
import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';
import 'movie_favorits_screen.dart';

class MovieFavoritsPage extends StatefulWidget {
  const MovieFavoritsPage({Key? key}) : super(key: key);

  @override
  State<MovieFavoritsPage> createState() => _MovieFavoritsPageState();
}

class _MovieFavoritsPageState extends State<MovieFavoritsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Movie Favorit'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const MovieFavoritsScreen(),
        ),
      ),
    );
  }
}
