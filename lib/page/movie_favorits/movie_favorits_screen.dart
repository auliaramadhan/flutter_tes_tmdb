import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    context.read<MovieState>().getPopularsMovie();
  }

  @override
  Widget build(BuildContext context) {
    final movieState = context.watch<MovieState>();
    final double itemHeight = 360;
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
                    final movie = movieState.listPopular[index];
                    return InkWell(
                      onTap: () {
                        // AutoRouter.of(context).push(EditMovieRoute(movie: movie));
                      },
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                child: Image.network(
                                  ((movie.posterPath ?? movie.poster) != null) ? ApiUrl.BASE_IMAGE + (movie.posterPath ?? movie.poster!) : AppImage.noImage,
                                  height: 200,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              Text(movie.title, style: AppFont.title16, textAlign: TextAlign.center,),
                              Text(movie.director, style: AppFont.subtitle12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(movie.voteAverage.toString(), style: AppFont.subtitle12),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
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
