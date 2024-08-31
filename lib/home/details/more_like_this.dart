import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/ResponseSimilarMovies.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoreLikeThis extends StatelessWidget {
  final Similar similar;
  const MoreLikeThis({super.key, required this.similar});

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
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5)),
                child: CachedNetworkImage(
                  imageUrl: similar.posterPath != null
                      ? "$baseUrl${similar.posterPath}"
                      : '',
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: MediaQuery.of(context).size.height * 0.15,
                  fit: BoxFit.fill,
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

            /// Icon Book mark
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 3),
              child: Icon(
                Icons.bookmark,
                color: AppColors.iconBookMarkColor,
              ),
            ),

            /// Icon add
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
                size: 12,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.158,
                  left: MediaQuery.of(context).size.width * 0.018),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: AppColors.iconBookMarkColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.223,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rate_rounded,
                            color: AppColors.yellowColor,
                            size: 15,
                          ),
                          Text(
                            "${similar.voteAverage ?? ''}",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.009,
                      ),
                      Text(
                        similar.title ??
                            '                                                                                 ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 10),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.009,
                      ),
                      Text(
                        similar.releaseDate ?? '',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
