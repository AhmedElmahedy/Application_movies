import 'package:app_movies/watchlist/movies_details.dart';
import 'package:app_movies/watchlist/watchlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../model/movies_response.dart';
import 'FireBase/firebase_Service.dart';

class WatchListTab extends StatefulWidget {
  @override
  State<WatchListTab> createState() => _WatchListTabState();
}

class _WatchListTabState extends State<WatchListTab> {
  final _firestoreService = FireStoreService();
  List<Movie> moviesList = [];
  @override
  void initState() {
    super.initState();
    getFavorites();
  }

  Future<void> getFavorites() async {
    moviesList = (await _firestoreService.fetchFavorites());
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    var watchlistProvider = Provider.of<WatchListProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title:
            Text("WatchList", style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: AppColors.blackColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final movie = moviesList[index];
                return MoviesDetails(
                  movie: movie,
                );
              },
              itemCount: moviesList.length,
            ),
          )
        ],
      ),
    );
  }
}
