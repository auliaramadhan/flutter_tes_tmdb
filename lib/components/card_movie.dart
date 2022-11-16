import 'package:flutter/material.dart';

import '../model/movie_list_response.dart';
import '../theme/appfont.dart';
import '../theme/image.dart';
import '../utils/api_url.dart';
import 'spacing.dart';


class CardMovie extends StatelessWidget {
  final MovieData movie;
  final VoidCallback onTap;
  final VoidCallback pressFavorit;
  final bool isFavorit;
  const CardMovie({super.key, required this.movie, required this.onTap, required this.pressFavorit, required this.isFavorit});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(builder: (context, constraint) {
        return Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    child: Image.network(
                      ApiUrl.BASE_IMAGE + (movie.posterPath ?? movie.poster!),
                      height: constraint.maxHeight - 70,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
                  IconButton(
                    onPressed: pressFavorit,
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorit ? Colors.red : Colors.grey,
                    ),
                  )
                ],
              ),
              const ExtraHeight(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ExtraWidth(8),
                  if (movie.voteAverage >= 7) Image.asset(AppImage.rottenFresh, height: 40, width: 40),
                  if (4 < movie.voteAverage && movie.voteAverage < 7) Image.asset(AppImage.rottenNegative, height: 40, width: 40),
                  if (movie.voteAverage <= 4) Image.asset(AppImage.rottenStink, height: 40, width: 40),
                  const ExtraWidth(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: constraint.maxWidth - 80,
                        child: Text(
                          movie.title,
                          style: AppFont.bodyBold,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(movie.voteAverage.toString(), style: AppFont.subtitle12),
                    ],
                  ),
                  const ExtraWidth(8),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
