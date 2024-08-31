import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/Category_fragment.dart';
import 'package:app_movies/browse/Category_item.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:flutter/material.dart';

import 'genre_details.dart';

class BrowseTab extends StatefulWidget {
  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            title: Text("Browse Category",
                style: Theme.of(context).textTheme.titleMedium),
            backgroundColor: AppColors.blackColor),
        body: selectedcategory == null
            ? CategoryFragment(
                onCategoryitemClicked: onCategoryitemClicked,
              )
            : GenreDetails(category: selectedcategory!));
  }

  Category? selectedcategory;

  void onCategoryitemClicked(Category newcategory) {
    selectedcategory = newcategory;
    setState(() {});
  }
  }
