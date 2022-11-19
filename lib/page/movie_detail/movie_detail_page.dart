import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/helper/utils.dart';
import 'package:flutter_starter_private/mobx/movie/movie_state.dart';
import 'package:flutter_starter_private/theme/apptheme.dart';
import 'package:flutter_starter_private/utils/storage_helper.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
      // untuk test
      appBar: (Platform.isAndroid || Platform.isIOS ) ? null : AppBar(),
      body: ReactionBuilder(
        builder: (_) => reaction<String?>((_) {
          return context.read<MovieState>().message;
        } , (message) {
          // if (message != null) {
          //   Utils.showAlert(text: message);
          // }
        }),
        child: SafeArea(
          key: Key('MovieDetailPage'),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: SizeConfig.screenWidth,
                  padding: const EdgeInsets.all(16.0),
                  child: MovieDetailScreen(
                    movieId: widget.movieId,
                    isFavorit: widget.isFavorit,
                  ),
                ),
              ),
              Observer(
                builder: (context) {
                  final isLoading = context.watch<MovieState>().isLoading;
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
