import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_screen.dart';
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
    return Column(
      children: [
        Stack(
          children: [
            /// Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => DetailsScreen(moviesId: results.id),));
                },
                child: CachedNetworkImage(
                  imageUrl: results.posterPath != null
                      ? "$baseUrl${results.posterPath}"
                      : '',
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
              ),
            ),
            FavoriteFunc(results: results)
          ],
        ),
        Container(
           padding:EdgeInsets.all(MediaQuery.of(context).size.height *0.01),
          decoration: const BoxDecoration(
              color: AppColors.iconBookMarkColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.45,
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
        )
      ],
    );
  }
}
