
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/watchlist/FireBase/Results_error_Solution/results_abstract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Unfavoritefunc extends StatefulWidget {
  final BaseResults results;
  const Unfavoritefunc({required this.results});

  @override
  State<Unfavoritefunc> createState() => _UnfavoritefuncState();
}

class _UnfavoritefuncState extends State<Unfavoritefunc> {
  bool isFavorite = false;

  void _toggleFavorite() {
    if (isFavorite) {
      _removeFromFavorites();
    } else {
      _addToFavorites();
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  void _addToFavorites() async {
    try {
      final movieData = {
        'title': widget.results.title,
        'posterPath': widget.results.posterPath,
        'releaseDate': widget.results.releaseDate,
        'id': widget.results.id,
      };

      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(widget.results.id
          .toString()) // Assuming 'id' is the unique identifier
          .set(movieData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to favorites!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding to favorites: $error')),
      );
    }
  }

  void _removeFromFavorites() async {
    try {
      await FirebaseFirestore.instance
          .collection('favorites')
          .doc(widget.results.id.toString())
          .delete();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed from favorites!')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing from favorites: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(size: 30,
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? AppColors.greyColor:Colors.red ,
      ),
      onPressed: _toggleFavorite,
    );
  }
}
