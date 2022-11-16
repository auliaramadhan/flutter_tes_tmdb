import 'package:flutter/material.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/theme/apptheme.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';

import 'movie_detail_screen.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  final bool isFavorit;
  const MovieDetailPage({
    Key? key,
    required this.movieId,
    required this.isFavorit,
  }) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.all(16.0),
            child: MovieDetailScreen(
              movieId: widget.movieId,
              isFavorit: widget.isFavorit,
            ),
          ),
        ),
      ),
    );
  }
}
