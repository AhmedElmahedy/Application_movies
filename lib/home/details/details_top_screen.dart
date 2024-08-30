import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/ResponseDetailsSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetailsTopScreen extends StatelessWidget {
  final ResponseDetailsSuccess details;
  const DetailsTopScreen({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CachedNetworkImage(
          imageUrl: details.backdropPath != null
              ? "$baseUrl${details.backdropPath}"
              : '',
          height: MediaQuery.of(context).size.height * 0.23,
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.yellowColor)),
          errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error, color: AppColors.yellowColor)),
        ),

        /// Center Screen
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            details.title ?? '',
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(details.releaseDate ?? '' ,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 10, color: AppColors.silverColor)),
        ),
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(6.0),
                child: CachedNetworkImage(
                  imageUrl: details.posterPath != null
                      ? "$baseUrl${details.posterPath}"
                      : '',
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.yellowColor)),
                  errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error, color: AppColors.yellowColor)),
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.25,
                  fit: BoxFit.fill,
                )),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.25,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Wrap(
                          runSpacing: 5.0,
                          spacing: 8.0,
                          children: details.genres!.map((genre) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1,
                                    color: AppColors.iconBookMarkColor),
                              ),
                              child: Text(
                                genre.name ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                        fontSize: 10,
                                        color: AppColors.silverColor),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Text(
                        details.overview ?? '',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontSize: 13, color: AppColors.silverColor),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.yellowColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${details.voteAverage}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 18),
                            ),
                          ),
                        ],
                      )
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
