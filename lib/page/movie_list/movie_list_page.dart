import 'package:flutter/material.dart';

import '../../components/spacing.dart';
import '../../theme/appfont.dart';
import '../../theme/apptheme.dart';
import 'movie_list_screen.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Movie List'),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (_) => CreateMoviePage()));
            },
            child: Text("New", style: AppFont.white),
            style: AppTheme.buttonTextPrimary,
          ),
          ExtraWidth(32),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const MovieListScreen(),
        ),
      ),
    );
  }
}
