import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/ResponsePopularSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final Results results;
  const NameWidget({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.27,
        child: CachedNetworkImage(
          imageUrl: results.backdropPath != null
              ? '$baseUrl${results.backdropPath}'
              : '',
          fit: BoxFit.fill,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
            color: AppColors.whiteColor,
          )),
          errorWidget: (context, url, error) => const Center(
              child: Icon(
            Icons.error,
            color: AppColors.yellowColor,
          )),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.01,
          top: MediaQuery.of(context).size.height * 0.16,
          left: MediaQuery.of(context).size.height * 0.015,
          right: MediaQuery.of(context).size.width * 0.6,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
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
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.28,
            left: MediaQuery.of(context).size.width * 0.43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// text name movies
            Text(results.title!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.whiteColor)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            /// Text time movies
            Text(results.releaseDate!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.nobelColor, fontSize: 12)),
          ],
        ),
      ),
    ]);
  }
}
