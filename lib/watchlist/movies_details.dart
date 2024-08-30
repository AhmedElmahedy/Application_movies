import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/movies_response.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatelessWidget {
  Movie movie;
  MoviesDetails({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.40,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: movie.posterPath != null ?
                    '$baseUrl${movie.posterPath}':'' ,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(
                        child: Icon(
                      Icons.error,
                      color: AppColors.yellowColor,
                    )),
                  ),
                ),
                const Icon(
                  Icons.bookmark,
                  size: 40,
                  color: AppColors.iconBookMarkColor,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.check,
                    size: 20,
                     color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(fontSize: 20)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              Text(
                movie.releaseDate ?? '',
                style: Theme.of(context)
                    .textTheme

                    .titleMedium!
                    .copyWith(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                "Release Date",
                style: TextStyle(color: Colors.white54),
              ),
              SizedBox(height: 10),

                    .titleSmall
                    ?.copyWith(color: AppColors.grayColor),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
