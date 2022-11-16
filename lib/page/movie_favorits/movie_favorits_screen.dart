import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter_private/components/card_movie.dart';
import 'package:flutter_starter_private/page/movie_detail/movie_detail_page.dart';
import 'package:provider/provider.dart';

import '../../helper/size_config.dart';
import '../../mobx/movie/movie_state.dart';
import '../../theme/appfont.dart';
import '../../theme/image.dart';
import '../../utils/api_url.dart';

class MovieFavoritsScreen extends StatefulWidget {
  const MovieFavoritsScreen({Key? key}) : super(key: key);

  @override
  State<MovieFavoritsScreen> createState() => _MovieFavoritsScreenState();
}

class _MovieFavoritsScreenState extends State<MovieFavoritsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MovieState>().getFavoritMovie();
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
                    final movie = movieState.listFavorit[index];
                    return CardMovie(
                      movie: movie,
                      onTap: () {
                        print('inkwell');
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) => MovieDetailPage(movieId: movie.id, isFavorit: true)));
                      },
                      isFavorit: true,
                      pressFavorit: () {
                        if (movieState.isLoading) return;
                        context.read<MovieState>().removeFavorite(movie.id);
                      },
                    );
                  },
                  itemCount: movieState.listFavorit.length,
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
