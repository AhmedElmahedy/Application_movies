import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/ResponsePressedGenre.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../watchlist/FireBase/favorite_func.dart';

class MoviesWidget extends StatelessWidget {
  final GenresResults results;

  const MoviesWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Expanded(
      child: Column(
        children: [
          Stack(
            children: [
              /// Image
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width * 0.4,
                    imageUrl: results.posterPath != null
                        ? "$baseUrl${results.posterPath}"
                        : '',
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * 0.25,
                  )),

              Padding(
                  padding: const EdgeInsets.only(top: 5, left: 3),
                  child: FavoriteFunc(results: results))
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.iconBookMarkColor,
                borderRadius: BorderRadius.circular(0)),
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColors.yellowColor,
                          size: 13,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          results.voteAverage?.toStringAsFixed(1) ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      results.title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      results.releaseDate ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 15, color: AppColors.nobelColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
