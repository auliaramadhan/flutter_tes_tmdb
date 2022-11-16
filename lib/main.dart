import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_starter_private/mobx/movie/movie_state.dart';
import 'package:flutter_starter_private/myapp.dart';
import 'package:flutter_starter_private/repository/movie_repository.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  // set mobx
  runApp(Provider(
    create: (context) => MovieState(
      movieRepo: MovieRepositoryImpl(),
    ),
    child: const MyApp(),
  ));
}
