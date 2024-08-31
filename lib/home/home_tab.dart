import 'package:app_movies/app_colors.dart';
import 'package:app_movies/home/NameMovies/names_movies.dart';
import 'package:app_movies/home/NewReleases/new_releases.dart';
import 'package:app_movies/home/Recommended/recommended.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          /// top Screen
          const Expanded(
            child: NamesMovies(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          /// center screen (New Releases)
          Container(
            height: MediaQuery.of(context).size.height * 0.210989010989011,
            color: AppColors.heavyMetalColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.005),
                  child: Text(
                    'New Releases ',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 15),
                  ),
                ),
                const NewReleases()
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          /// bottom screen (Recommended)
          Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: AppColors.heavyMetalColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.02,
                        top: MediaQuery.of(context).size.height * 0.005),
                    child: Text(
                      "Recommended",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(fontSize: 15),
                    ),
                  ),
                  Recommended()
                ],
              )),
        ],
      ),
    );
  }
}




































