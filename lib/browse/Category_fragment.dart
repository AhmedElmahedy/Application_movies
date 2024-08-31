import 'package:app_movies/browse/Category_item.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:app_movies/browse/genre_details.dart';
import 'package:flutter/material.dart';


class CategoryFragment extends StatelessWidget {
  var categoriesList = Category.getCategories();
  Function onCategoryItemClicked;
  CategoryFragment({required this.onCategoryItemClicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                   crossAxisSpacing: MediaQuery.of(context).size. width * 0.02
              ),

              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GenreDetails(category: categoriesList[index]),
                          ));
                    },
                    child: CategoryItem(
                        category: categoriesList[index]));
              },
              itemCount: categoriesList.length,
            ),
          )
        ],
      ),
    );
  }
}
