import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter_private/page/movie_detail/movie_detail_page.dart';
import 'package:provider/provider.dart';

import '../../components/card_movie.dart';
import '../../helper/size_config.dart';
import '../../mobx/movie/movie_state.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MovieState>().getListMovie();
  }

  @override
  Widget build(BuildContext context) {
    final movieState = context.watch<MovieState>();
    final double itemHeight = (SizeConfig.screenWidth / 2) * 1.4;
    final double itemWidth = SizeConfig.screenWidth / 2;

    return Observer(
      builder: (context) => Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GridView.builder(
                  itemBuilder: (context, index) {
                    final movie = movieState.listMovie[index];
                    final isFavorite = movieState.indexPopular.contains(index);
                    return CardMovie(
                      movie: movie,
                      onTap: () {
                        print('inkwell');
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => MovieDetailPage(movieId: movie.id, isFavorit: isFavorite)));
                      },
                      isFavorit: isFavorite,
                      pressFavorit: () {
                        if (movieState.isLoading) return;
                        if (isFavorite) {
                          context.read<MovieState>().removeFavorite(movie.id);
                        } else {
                          context.read<MovieState>().addFavorite(movie);
                        }
                      },
                    );
                  },
                  itemCount: movieState.listMovie.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: itemWidth / itemHeight,
                  ),
                ),
              )
            ],
          ),
          if (movieState.isLoading) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
