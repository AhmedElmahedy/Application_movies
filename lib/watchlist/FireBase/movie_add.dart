
import 'package:app_movies/watchlist/FireBase/firebase_Service.dart';
import 'package:flutter/material.dart';

import '../../model/movies_response.dart';


class MovieTile extends StatelessWidget {
  final Map<String, dynamic> movieData;
  final FireStoreService _firestoreService = FireStoreService();

  MovieTile({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      trailing: IconButton(
        icon: const Icon(Icons.favorite_border),
        onPressed: () {
          _addToFavorites(context, movieData);
        },
      ),
    );
  }

  void _addToFavorites(BuildContext context, Map<String, dynamic> movieData) {
    _firestoreService.addFavorite(movieData as Movie).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Added to favorites!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add to favorites: $error')),
      );
    });
  }
}
