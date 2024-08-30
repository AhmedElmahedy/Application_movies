import 'package:app_movies/app_colors.dart';
import 'package:app_movies/browse/Category_item.dart';
import 'package:app_movies/browse/category_details.dart';
import 'package:flutter/material.dart';

class CategoryFragment extends StatelessWidget {
var categoriesList= Category.getcategories();

Function onCategoryitemClicked;
CategoryFragment({required this.onCategoryitemClicked});

@override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,

      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),
                itemBuilder: (context,index){
              SizedBox(height: 10,);
              return InkWell(onTap: (){  onCategoryitemClicked(categoriesList[index]);},child: CategoryItem(category: categoriesList[index], index: index));
                },itemCount: categoriesList.length,),
          )

        ],
      ),
    );
  }
}


