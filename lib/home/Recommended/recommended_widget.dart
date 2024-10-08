import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/model/ResponseRecommendedSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../watchlist/FireBase/favorite_func.dart';

class RecommendedWidget extends StatelessWidget {
  final Results results;
  const RecommendedWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Column(
      children: [
        Stack(
          children: [
            /// Image
            Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(moviesId: results.id)));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    child: CachedNetworkImage(
                      imageUrl: results.posterPath != null
                          ? "$baseUrl${results.posterPath}"
                          : '',
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.height * 0.15,
                    ),
                  ),
                )),

            Padding(
                padding: const EdgeInsets.only(top: 5, left: 3),
                child: FavoriteFunc(results: results)),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.158,
                left: MediaQuery.of(context).size.width * 0.016,
              ),
              child: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.symmetric(horizontal: 1),
                decoration: BoxDecoration(
                    color: AppColors.iconBookMarkColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.222,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.yellowColor,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            results.voteAverage != null
                                ? results.voteAverage!.toStringAsFixed(1)
                                : '',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 10),
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
                            ?.copyWith(fontSize: 10),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        results.releaseDate ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(
                                fontSize: 8, color: AppColors.nobelColor),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
