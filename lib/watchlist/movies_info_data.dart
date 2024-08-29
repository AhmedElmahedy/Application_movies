import 'package:app_movies/model/movies_response.dart';
import 'package:app_movies/watchlist/FireBase/firebase_Service.dart';
import 'package:flutter/material.dart';

class MovieInformation extends StatelessWidget {
final Map<String , dynamic> movieData;
final FireStoreService fireStoreService = FireStoreService();
MovieInformation({required this.movieData});
  @override
  Widget build(BuildContext context) {
          return ListTile(
            trailing: IconButton(
                onPressed: (){
                  addToFavorites(BuildContext, movieData);

                },
                icon: Icon(Icons.favorite)),
          );
  }

  void addToFavorites(context, Map<String,dynamic> movieData) async {
    try{
      final movie = Movie.fromMap(movieData);
      await fireStoreService.addFavorite(movie);
      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to Fevorites!'))
      );
    }catch(error){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add To Favorites:$error'))
      );

    }
  }
}