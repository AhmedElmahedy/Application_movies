import 'package:app_movies/app_colors.dart';


import 'package:app_movies/watchlist/FireBase/Results_error_Solution/results_abstract.dart';
import 'package:app_movies/watchlist/FireBase/favorite_func.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/model/ResponseUpcomingSuccess.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewReleasesWidget extends StatelessWidget {

  final BaseResults results;
  NewReleasesWidget({required this.results});

  const NewReleasesWidget({super.key, required this.results});
  final Results results;

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Row(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  moviesId: results.id,
                                )));
                  },
                  child: CachedNetworkImage(
                    imageUrl: results.posterPath != null
                        ? "$baseUrl${results.posterPath}"
                        : '',
                    placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    )),
                    errorWidget: (context, url, error) => const Center(
                        child: Icon(
                      Icons.error,
                      color: AppColors.yellowColor,
                    )),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 3),
              child:  FavoriteFunc(results: results)
            )
          ],
        )
      ],
    );
  }
}
