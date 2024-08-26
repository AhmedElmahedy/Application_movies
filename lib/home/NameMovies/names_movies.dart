import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/NameMovies/items_name_movies.dart';
import 'package:flutter/material.dart';

class NamesMovies extends StatefulWidget {
  const NamesMovies({super.key});

  @override
  State<NamesMovies> createState() => _NamesMoviesState();
}

class _NamesMoviesState extends State<NamesMovies> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getPopular(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ));
          } else if (snapshot.hasError) {
            return Column(
              children: [
                const Text("Something went wrong"),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getPopular();
                      setState(() {});
                    },
                    child: const Text("Try again")),
              ],
            );
          }

          /// server  => success , error
          if (snapshot.data!.success == false) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.2),
                  child: Text(snapshot.data!.statusMessage ?? 'Unknown error',
                      style: const TextStyle(color: AppColors.whiteColor)),
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getPopular();
                      setState(() {});
                    },
                    child: const Text("Try again Server"))
              ],
            );
          }
          var list = snapshot.data!.results!;
          return ItemsNameMovies(resultsList: list);
        });
  }
}
