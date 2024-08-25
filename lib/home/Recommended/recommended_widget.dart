import 'package:app_movies/app_colors.dart';
import 'package:app_movies/model/ResponseRecommendedSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  final Results results;
  RecommendedWidget({required this.results});

   @override
  Widget build(BuildContext context) {
     String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return  Column(
      children: [
        Stack(
          children: [
            /// Image
            Padding(
              padding: const EdgeInsets.only(top:8 ,left:8 ,right: 8),
              child: CachedNetworkImage(
                imageUrl: results.posterPath != null ? "$baseUrl${results.posterPath}":'',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height *0.15,
              )
            ),
            /// Icon Book mark
            const Padding(
              padding: EdgeInsets.only(
                  top: 5,left: 3
              ),
              child: Icon(Icons.bookmark,
                color: AppColors.iconBookMarkColor,),
            ),
            /// Icon add
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.add,
                color: AppColors.whiteColor,
                size: 12,),
            )
          ],
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.iconBookMarkColor,
              borderRadius: BorderRadius.circular(0)),
          height: MediaQuery.of(context).size.height *0.1,
          width: MediaQuery.of(context).size.width *0.22,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.star,color: AppColors.yellowColor, size: 10,),
                    SizedBox(width: 4,),
                    Text(results.voteAverage != null ? results.voteAverage!.toStringAsFixed(1) : '',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 10
                      ),),
                  ],
                ),
                SizedBox(height: 4,),                Text(results.title ?? '',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10
                ),),
                SizedBox(height: 4,),
                Text(results.releaseDate ?? '',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 8,
                  color: AppColors.nobelColor
                ),),
              ],
            ),
          ),
        )
      ],
    );
  }
}
// height: MediaQuery.of(context).size.height *0.15,
