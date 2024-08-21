import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

class NamesMovies extends StatelessWidget {
  const NamesMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/images/Image_test.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: MediaQuery.of(context).size.height * 0.3,
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.12,
          left: MediaQuery.of(context).size.height * 0.02,
          right: MediaQuery.of(context).size.width * 0.6,
        ),
        child: Image.asset(
          'assets/images/Image.png',
          fit: BoxFit.fill,
        ),
      ),

      /// text name movies
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.26,
            left: MediaQuery.of(context).size.height * 0.20),
        child: Text('Dora and the lost city of gold',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: AppColors.whiteColor)),
      ),

      /// Text time movies
      Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.3,
            left: MediaQuery.of(context).size.height * 0.20),
        child: Text(
          '2019  PG-13  2h 7m',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    ]);
  }
}
