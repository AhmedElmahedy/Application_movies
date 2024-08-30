import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/Category_fragment.dart';
import 'package:app_movies/browse/Category_item.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:flutter/material.dart';

class BrowseTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse Category", style: Theme
        .of(context)
        .textTheme
        .titleMedium),
    backgroundColor: AppColors.blackColor

    ),
    body:
    CategoryFragment(onCategoryitemClicked: onCategoryitemClicked,)



    );
  }
}
Category? selectedcategory;
void onCategoryitemClicked(Category newcategory) {
  selectedcategory=newcategory;
}