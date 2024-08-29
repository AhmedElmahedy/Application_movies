import 'package:app_movies/model/movies_response.dart';
import 'package:flutter/material.dart';

class MoviesDetails extends StatelessWidget {
  Movie movie ;

  MoviesDetails({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.40,
          height: MediaQuery.of(context).size.height * 0.12,
          child: Stack(
            children: [
              Image.network(
               movie.posterPath  != null ?
                '$baseUrl${movie.posterPath}': '',
                fit: BoxFit.cover,
                width: 200,
                height: 120,
                errorBuilder: (context, url, error) => Center(
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Icon(
                  Icons.check_box_rounded,
                  size: 40,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 10),
            Text(movie.releaseDate, style: TextStyle(color: Colors.white54)),
            SizedBox(height: 10),
            Text("Film Actors", style: TextStyle(color: Colors.white54)),
          ],
        ),
      ],
    );
  }
}
