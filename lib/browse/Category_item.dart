import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;

  CategoryItem({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width * 1.58,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.all(Radius.circular(35)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image.asset(
              category.imagepath,
              width: MediaQuery.of(context).size.width*1.58,
              height:MediaQuery.of(context).size.height* 0.9,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('Image not found'));
              },
            ),
          ),
          Center(
              child: Text(
            "${category.title}",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
          ))
        ],
      ),
    );
  }
}
