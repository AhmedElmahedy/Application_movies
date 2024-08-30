import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_screen.dart';
import 'package:app_movies/model/ResponseSearchSuccess.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}
class _SearchTabState extends State<SearchTab> {
  Future<ResponseSearchSuccess?>? movies;
  TextEditingController controller = TextEditingController();

  void searchMovies(String query) {
    setState(() {
      movies = ApiManager.getSearchMovies(query);
    });
  }
  @override
  Widget build(BuildContext context) {
    String baseUrl = 'https://image.tmdb.org/t/p/w500';
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.01,
                right: MediaQuery.of(context).size.height * 0.02,
                left: MediaQuery.of(context).size.height * 0.02),
            child: TextField(
              controller: controller,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 18),
              onChanged: searchMovies,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.iconBookMarkColor,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  hintText: 'Search',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.grayColor),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.whiteColor,
                    size: 30,
                  ),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(
                            Icons.clear,
                            color: AppColors.whiteColor,
                          ),
                          onPressed: () {
                            controller.clear();
                            setState(() {
                            });
                          })
                      : null),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.yellowColor));
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Something went wrong"));
                  }
                  if (!snapshot.hasData || snapshot.data!.results!.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/local_movies.png",
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text("No movies found",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: AppColors.grayColor))
                      ],
                    );
                  }
                  var moviesList = snapshot.data!.results!;
                  return ListView.builder(
                      itemCount: moviesList.length,
                      itemBuilder: (context, index) {
                        var movie = moviesList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(moviesId: movie.id)));
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: CachedNetworkImage(
                                    imageUrl: movie.posterPath != null
                                        ? "$baseUrl${movie.posterPath}"
                                        : '',
                                    placeholder: (context, url) => const Center(
                                        child: CircularProgressIndicator(
                                            color: AppColors.yellowColor)),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                            child: Icon(Icons.error,
                                                color: AppColors.yellowColor)),
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    width: MediaQuery.of(context).size.width *
                                        0.357142857142857,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(fontSize: 18),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text(
                                        movie.releaseDate ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                                fontSize: 16,
                                                color: AppColors.grayColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
        ]));
  }
}
