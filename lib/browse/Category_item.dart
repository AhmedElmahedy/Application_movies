import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  CategoryItem({required this.category});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Image.asset(
            category.imagePath,
            width: MediaQuery.of(context).size.width*  0.5,
            height:MediaQuery.of(context).size.height * 0.2,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Text(category.title,
            style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor),
                    ),
        )
      ],
    );
  }
}
