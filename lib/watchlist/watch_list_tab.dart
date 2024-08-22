import 'package:app_movies/app_colors.dart';
import 'package:app_movies/watchlist/movie_details.dart';
import 'package:flutter/material.dart';



class WatchListTab extends StatelessWidget {
   List<String> movieslist = [
    'Ahlam',
    'Marvel',
    'Spiderman',
    'Superman',
    'Batman',
    'Barbie',
    'Anyone But You',
    'It Ends with us',
    'Love Story',
    'Money Talks'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          title: Text("WatchList", style: Theme
              .of(context)
              .textTheme
              .titleMedium),
          backgroundColor: AppColors.blackColor,
        ),
        body: Column(
    children:[ Expanded(
      child: ListView.builder(
      itemBuilder: (context, index) {
        return MoviesDetails(index: index,MovieTitle: 'Title');
      },

      itemCount: movieslist.length,
      ),
    ),]
    )

            );



  }
}


