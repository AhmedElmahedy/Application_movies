import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/Category_fragment.dart';
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
        backgroundColor: AppColors.background,
        appBar: AppBar(
            title: Text("Browse Category",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontSize: 22)),
            backgroundColor: AppColors.blackColor),
        body: selectedCategory == null
            ? CategoryFragment(
                onCategoryItemClicked: onCategoryItemClicked,
              )
            : GenreDetails(category: selectedCategory!));
  }

  Category? selectedCategory;
  void onCategoryItemClicked(Category newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }
}
