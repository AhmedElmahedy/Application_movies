// import 'package:app_movies/api/api_manager.dart';
// import 'package:app_movies/app_colors.dart';
// import 'package:app_movies/browse/movies_widget.dart';
//
// import 'package:app_movies/model/ResponsePressedGenre.dart';
// import 'package:flutter/material.dart';
//
// import 'category_details.dart';
//
// class GenreDetails extends StatefulWidget {
//   final Category category;
//   GenreDetails({required this.category});
//
//   @override
//   State<GenreDetails> createState() => _GenreDetailsState();
// }
//
// class _GenreDetailsState extends State<GenreDetails> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ResponsePressedGenre?>(
//       future: ApiManager.getGenresDetails(widget.category.id ?? ''),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: AppColors.yellowColor,
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Column(
//             children: [
//               Text("Something went wrong",
//                   style: Theme.of(context).textTheme.titleLarge),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getGenresDetails(widget.category.id??"");
//                   setState(() {});
//                 },
//                 child: Text("Try Again",
//                     style: Theme.of(context).textTheme.titleSmall),
//               ),
//             ],
//           );
//         }
//
//         // Add null check before accessing data
//         if (snapshot.data == null || snapshot.data!.success != 'ok') {
//           return Column(
//             children: [
//               Text(
//                 snapshot.data?.status_message ?? "Unknown error",
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ApiManager.getGenresDetails(widget.category.id??"");
//                   setState(() {});
//                 },
//                 child: Text("Try Again",
//                     style: Theme.of(context).textTheme.titleLarge),
//               ),
//             ],
//           );
//         }
//
//         var genreslist = snapshot.data!.results!;
//
//         if (genreslist.isEmpty) {
//           return Center(
//             child: Text("No genres available",
//                 style: Theme.of(context).textTheme.titleLarge),
//           );
//         }
//
//         return ListView.builder(
//           itemBuilder: (context, index) {
//             return MoviesWidget(results: genreslist[index]);
//           },
//           itemCount: genreslist.length,
//         );
//       },
//     );
//   }
// }














import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/movies_widget.dart';
import 'package:app_movies/model/ResponsePressedGenre.dart';
import 'package:flutter/material.dart';

import 'category_details.dart';

class GenreDetails extends StatefulWidget {
  final Category category;
  GenreDetails({required this.category});

  @override
  State<GenreDetails> createState() => _GenreDetailsState();
}

class _GenreDetailsState extends State<GenreDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponsePressedGenre?>(
      future: ApiManager.getGenresDetails('${widget.category.id}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ),
          );
        } else if (snapshot.hasError) {
          print('Error: ${snapshot.error}');
          return Column(
            children: [
              Text("Something went wrong",
                  style: Theme.of(context).textTheme.titleLarge),
              ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: Text("Try Again",
                    style: Theme.of(context).textTheme.titleSmall),
              ),
            ],
          );
        }

        if (snapshot.data == null || snapshot.data!.results == null || snapshot.data!.results!.isEmpty) {
          print('No movies found for genre: ${widget.category.id}');
          return Center(
            child: Text("No movies available for this genre",
                style: Theme.of(context).textTheme.titleLarge),
          );
        }

        var genresList = snapshot.data!.results!;
        print('Movies found: ${genresList.length}');

        return ListView.builder(
          itemBuilder: (context, index) {
            return MoviesWidget(results: genresList[index]);
          },
          itemCount: genresList.length,
        );
      },
    );
  }
}

