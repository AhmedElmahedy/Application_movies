import 'package:app_movies/api/api_manager.dart';
import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/details/details_top_screen.dart';
import 'package:app_movies/home/details/more_like_this.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final int? moviesId;
  const DetailsScreen({super.key, required this.moviesId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getDetailsMovies(widget.moviesId!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.yellowColor,
            ));
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  const Text('Something went wrong'),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getDetailsMovies(widget.moviesId!);
                        setState(() {});
                      },
                      child: const Text("Try Again"))
                ],
              ),
            );
          }
          if (snapshot.data!.success == false) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data!.statusMessage ?? ''),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getDetailsMovies(widget.moviesId!);
                        setState(() {});
                      },
                      child: const Text("Try Again Server"))
                ],
              ),
            );
          }
          var details = snapshot.data!;
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            appBar: AppBar(
              foregroundColor: AppColors.whiteColor,
              backgroundColor: AppColors.background,
              centerTitle: true,
              title: Text(
                details.title ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 20),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                /// Top screen
                SizedBox(
                    width: double.infinity,
                    child: DetailsTopScreen(details: details)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              
                /// Bottom screen
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: AppColors.heavyMetalColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 6, top: 5),
                        child: Text(
                          "More Like This",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 15),
                        ),
                      ),
                      FutureBuilder(
                          future:
                              ApiManager.getSimilarMovies(widget.moviesId! ?? 0),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                      color: AppColors.yellowColor));
                            } else if (snapshot.hasError) {
                              return Column(
                                children: [
                                  const Text('Something Went Wrong'),
                                  ElevatedButton(
                                      onPressed: () {
                                        ApiManager.getSimilarMovies(
                                            widget.moviesId! ?? 0);
                                        setState(() {});
                                      },
                                      child: const Text("Try again"))
                                ],
                              );
                            }
                            if (snapshot.data!.success == false) {
                              return Column(
                                children: [
                                  Text('Error: ${snapshot.data!.statusMessage}'),
                                  ElevatedButton(
                                      onPressed: () {
                                        ApiManager.getSimilarMovies(
                                            widget.moviesId! ?? 0);
                                        setState(() {});
                                      },
                                      child: const Text("Try again Server"))
                                ],
                              );
                            }
                            var similarList = snapshot.data!.results!;
                            return Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: similarList.length,
                                  itemBuilder: (context, index) {
                                    var similar = similarList[index];
                                    return MoreLikeThis(similar: similar);
                                  }),
                            );
                          })
                    ],
                  ),
                )
              ]),
            ),
          );
        });
  }
}