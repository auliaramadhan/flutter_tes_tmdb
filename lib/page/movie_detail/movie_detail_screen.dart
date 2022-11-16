import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_starter_private/components/form/text_form_border.dart';
import 'package:flutter_starter_private/components/spacing.dart';
import 'package:flutter_starter_private/helper/datetime.dart';
import 'package:flutter_starter_private/helper/size_config.dart';
import 'package:flutter_starter_private/mobx/movie/movie_state.dart';
import 'package:flutter_starter_private/model/movie_list_response.dart';
import 'package:flutter_starter_private/theme/image.dart';
import 'package:flutter_starter_private/utils/api_url.dart';
import 'package:flutter_starter_private/utils/constant.dart';
import 'package:provider/provider.dart';

import '../../components/button/button_primary.dart';
import '../../theme/appfont.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;
  final bool isFavorit;
  const MovieDetailScreen({Key? key, required this.movieId, required this.isFavorit}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final scale = SizeConfig.screenWidth / (SizeConfig.screenWidth - 48);

  bool isFavorit = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavorit = widget.isFavorit;
    });
    context.read<MovieState>().getDetailMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final movie = context.watch<MovieState>().movieDetail;
      final isloading = context.watch<MovieState>().isLoading;
      final indexFavorits = context.watch<MovieState>().indexPopular;
      final director = movie?.credits?.crew?.firstWhere((element) => element.job == 'Director');
      final castList = movie?.credits?.cast;
      if (movie == null || isloading) {
        return const Center(child: CircularProgressIndicator());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.scale(
            scale: scale,
            child: SizedBox(
              height: 360,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  final poster = movie.images!.posters![index];
                  return Image.network(
                    ApiUrl.BASE_IMAGE + poster.filePath!,
                    // width: SizeConfig.screenWidth,
                    fit: BoxFit.fill,
                  );
                },
                itemCount: (movie.images?.posters?.isNotEmpty ?? false) ? 10 : 0,
              ),
            ),
          ),
          const ExtraHeight(36),
          Text(movie.title, style: AppFont.headlineMedium),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(DatetimeApp.objectToStr(movie.releaseDate) ?? '', style: AppFont.subtitle),
              const Spacer(),
              IconButton(
                onPressed: isFavorit ? removeFavorit : addFavorit,
                icon: Icon(Icons.favorite, color: isFavorit ? Colors.red : Colors.grey),
              ),
            ],
          ),
          const ExtraHeight(8),
          Wrap(
            children: movie.genres
                .map(
                  (e) => Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(Constant.genreFilm[e]!, style: AppFont.body12),
                    ),
                  ),
                )
                .toList(),
          ),
          const ExtraHeight(8),
          Text(movie.overview, style: AppFont.subtitle),
          const ExtraHeight(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const ExtraWidth(8),
              if (movie.voteAverage >= 7) Image.asset(AppImage.rottenFresh, height: 30, width: 30),
              if (4 < movie.voteAverage && movie.voteAverage < 7) Image.asset(AppImage.rottenNegative, height: 30, width: 30),
              if (movie.voteAverage <= 4) Image.asset(AppImage.rottenStink, height: 30, width: 30),
              const ExtraWidth(8),
              Text('${movie.voteAverage} / ', style: AppFont.title18),
              const Text('10  ', style: AppFont.bodyBold),
              Center(child: Text('from ${movie.voteCount} vote', style: AppFont.body)),
            ],
          ),
          const ExtraHeight(),
          Text('Cast', style: AppFont.title18),
          const ExtraHeight(8),
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            shrinkWrap: true,
            childAspectRatio: (SizeConfig.screenWidth / 3) / 250,
            children: [
              // Text('data')
              if (director != null)
                Card(
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                        child: Image.network(
                          director.profilePath != null ? ApiUrl.BASE_IMAGE + director.profilePath! : AppImage.noImage,
                          height: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        director.name!,
                        style: AppFont.title16,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                      Text(director.job!, style: AppFont.subtitle),
                      const Spacer(),
                    ],
                  ),
                ),
              ...[
                for (var i = 0; i < ((castList!.length > 20) ? 20 : castList.length); i++)
                  Card(
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                          child: Image.network(
                            castList![i].profilePath != null ? ApiUrl.BASE_IMAGE + castList[i].profilePath! : AppImage.noImage,
                            height: 150,
                            width: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          castList![i].name!,
                          style: AppFont.title16,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        Text(castList[i].knownForDepartment ?? '', style: AppFont.subtitle),
                        const Spacer(),
                      ],
                    ),
                  ),
                // Card(
                //   elevation: 4,
                //   child: Column(
                //     children: [
                //       ClipRRect(
                //         borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                //         child: Image.network(
                //           ApiUrl.BASE_IMAGE + castList![i].profilePath!,
                //           height: 100,
                //           fit: BoxFit.fill,
                //         ),
                //       ),
                //       Text(castList[i].name!, style: AppFont.title16),
                //       Text(castList[i].job!, style: AppFont.subtitle),
                //     ],
                //   ),
                // )
              ],
            ],
          ),
          // const ExtraHeight(),
        ],
      );
    });
  }

  void addFavorit() {
    final movie = context.read<MovieState>().movieDetail!;
    context.read<MovieState>().addFavorite(MovieData(
          backdropPath: movie.backdropPath,
          id: movie.id,
          originalLanguage: movie.originalLanguage,
          originalTitle: movie.originalTitle,
          overview: movie.overview,
          popularity: movie.popularity,
          genreIds: movie.genres,
          releaseDate: movie.releaseDate,
          title: movie.title,
          director: 'no director',
          voteAverage: movie.voteAverage,
          voteCount: movie.voteCount,
        ));
  }

  void removeFavorit() {
    final movie = context.read<MovieState>().movieDetail!;
    context.read<MovieState>().removeFavorite(movie.id);
  }
}
