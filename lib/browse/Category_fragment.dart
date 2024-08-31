import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/Category_item.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:app_movies/browse/genre_details.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getcategories();

  Function onCategoryitemClicked;

  CategoryFragment({required this.onCategoryitemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      margin: EdgeInsets.all(7),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 40, crossAxisSpacing: 38),
              itemBuilder: (context, index) {
                SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
                );
                return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GenreDetails(category: categoriesList[index]),));
                      // onCategoryitemClicked(categoriesList[index]);
                    },
                    child: CategoryItem(
                        category: categoriesList[index], index: index));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
