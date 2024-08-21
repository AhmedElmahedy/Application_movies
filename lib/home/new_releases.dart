import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

class NewReleases extends StatelessWidget {
  const NewReleases({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset('assets/images/Image.png'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5, left: 3),
              child: Icon(
                Icons.bookmark,
                color: AppColors.iconBookMarkColor,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: AppColors.whiteColor,
                size: 12,
              ),
            )
          ],
        )
      ],
    );
  }
}
