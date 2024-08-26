import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/model/ResponseUpcomingSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewReleasesWidget extends StatelessWidget {
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
                                  results: results,
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
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 3),
              child: Icon(
                Icons.bookmark,
                color: AppColors.iconBookMarkColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
                size: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}
