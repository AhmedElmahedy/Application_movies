import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/browse_tab.dart';
import 'package:app_movies/browse/movies_widget.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/model/ResponsePressedGenre.dart';
import 'package:flutter/material.dart';

import 'category_details.dart';

class GenreDetails extends StatefulWidget {
  final Category category;
  static String routeName="Genre";

  GenreDetails({required this.category});

  @override
  State<GenreDetails> createState() => _GenreDetailsState();
}

class _GenreDetailsState extends State<GenreDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponsePressedGenre?>(
      future: ApiManager.getGenresDetails(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
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

        if (snapshot.data == null ||
            snapshot.data!.results == null ||
            snapshot.data!.results!.isEmpty) {
          print('No movies found for genre: ${widget.category.id}');
          return Center(
            child: Text("No movies available for this genre",
                style: Theme.of(context).textTheme.titleLarge),
          );
        }

        var genresList = snapshot.data!.results!;
        print('Movies found: ${genresList.length}');

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: AppColors.whiteColor,size: 30,),
            backgroundColor: AppColors.background,
            centerTitle: true,
            title: Text(
              widget.category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          body: GridView.builder(
            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62),
            itemBuilder: (context, index) {
              return MoviesWidget(results: genresList[index]);
            },
            itemCount: genresList.length,
          ),
        );
      },
    );
  }
}
