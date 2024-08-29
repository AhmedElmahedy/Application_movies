import 'package:flutter/material.dart';
import '../model/movies_response.dart';
import 'FireBase/firebase_Service.dart';

class WatchListProvider extends ChangeNotifier {
  final FireStoreService _firestoreService = FireStoreService();
  List<Movie> movies = [];
  // WatchListProvider(){
  //   fetchFavorites();
  // }

  Future<void> fetchFavorites() async {
    try {
      movies = await _firestoreService.fetchFavorites();
      notifyListeners();
    }catch (error){
      print('Error: $error');
    }
  }



  void addToFavorites(Movie movie) async {
    try {
      await _firestoreService.addFavorite(movie);
     if( !movies.contains(movie)) {
       movies.add(movie);
       notifyListeners();
     }
    }catch(error) {
      print("$error");
    }
    }

  void removeFromFavorites(Movie movie) async {
    try {
      await _firestoreService.removeFromFavorites(movie.id.toString());
      movies.remove(movie);
      notifyListeners();
    }catch (error){
      print('$error');
    }
  }
}
